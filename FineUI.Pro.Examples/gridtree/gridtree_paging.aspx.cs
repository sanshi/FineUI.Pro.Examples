using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.gridtree
{
    public partial class gridtree_paging : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            // 1.设置总项数（特别注意：数据库分页一定要设置总记录数RecordCount）
            Grid1.RecordCount = GetTotalCount();

            // 2.获取当前分页数据
            DataTable table = GetPagedDataTable(Grid1.PageIndex, Grid1.PageSize);

            // 3.绑定到Grid
            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        /// <summary>
        /// 模拟返回总项数
        /// </summary>
        /// <returns></returns>
        private int GetTotalCount()
        {
            DataTable source = DataSourceUtil.GetTreeDataTable();

            return GetTopNodeTable(source).Rows.Count;
        }

        private DataTable GetTopNodeTable(DataTable source)
        {
            DataTable topTable = source.Clone();

            foreach (DataRow row in source.Rows)
            {
                int parentId = Convert.ToInt32(row["ParentId"]);

                if (parentId == -1)
                {
                    topTable.ImportRow(row);
                }
            }

            return topTable;
        }

        /// <summary>
        /// 模拟数据库分页（实际项目中请直接使用SQL语句返回分页数据！）
        /// </summary>
        /// <returns></returns>
        private DataTable GetPagedDataTable(int pageIndex, int pageSize)
        {
            DataTable source = DataSourceUtil.GetTreeDataTable();
            DataTable topTable = GetTopNodeTable(source);

            DataTable paged = source.Clone();

            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > topTable.Rows.Count)
            {
                rowend = topTable.Rows.Count;
            }

            for (int i = rowbegin; i < rowend; i++)
            {
                DataRow topTableRow = topTable.Rows[i];
                paged.ImportRow(topTableRow);

                ImportCurrentPageTable(source, paged, Convert.ToInt32(topTableRow["Id"]));
            }

            return paged;
        }

        // 递归查找需要的行
        private void ImportCurrentPageTable(DataTable source, DataTable paged, int rowId)
        {
            foreach (DataRow row in source.Rows)
            {
                int parentRowId = Convert.ToInt32(row["ParentId"]);

                if (rowId == parentRowId)
                {
                    paged.ImportRow(row);

                    ImportCurrentPageTable(source, paged, Convert.ToInt32(row["Id"]));
                }
            }
        }

        #endregion

        #region Events

        protected void Grid1_PageIndexChanged(object sender, GridPageEventArgs e)
        {
            
            BindGrid();
        }

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            //if (e.RowID == "50" || e.RowID == "60")
            //{
            //    e.TreeNodeExpanded = true;
            //}
        }

        #endregion

    }
}
