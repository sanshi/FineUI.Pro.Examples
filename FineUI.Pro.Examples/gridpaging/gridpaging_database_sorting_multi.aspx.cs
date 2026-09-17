using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.gridpaging
{
    public partial class gridpaging_database_sorting_multi : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region BindGrid

        private string GetSortFieldTip(string sortField, string sortDirection)
        {
            var sortFieldTitle = "";
            foreach (var column in Grid1.Columns)
            {
                if (column.SortField == sortField)
                {
                    sortFieldTitle = column.HeaderText;
                    break;
                }
            }
            return String.Format("{0}（{1}）", sortFieldTitle, sortDirection == "ASC" ? "升序" : "降序");
        }

        private string GetSortTip()
        {
            List<string> sortTips = new List<string>();

            string[] sortFields = Grid1.SortFieldArray;
            // 多列排序
            if (sortFields.Length > 0)
            {
                for (var i = 0; i < sortFields.Length; i += 2)
                {
                    var sortField = sortFields[i];
                    var sortDirection = sortFields[i + 1];

                    sortTips.Add(GetSortFieldTip(sortField, sortDirection));
                }
            }
            
            return String.Format("排序字段：{0}", String.Join("，", sortTips));
        }

        private void BindGrid()
        {
            // 1.设置总项数（特别注意：数据库分页一定要设置总记录数RecordCount）
            Grid1.RecordCount = GetTotalCount();

            // 2.获取当前分页数据
            DataTable table = GetPagedDataTable();

            // 3.绑定到Grid
            Grid1.DataSource = table;
            Grid1.DataBind();

            labSortOrderTip.Text = GetSortTip();
        }

        /// <summary>
        /// 模拟返回总项数
        /// </summary>
        /// <returns></returns>
        private int GetTotalCount()
        {
            return DataSourceUtil.GetDataTable2().Rows.Count;
        }

        /// <summary>
        /// 模拟数据库分页（实际项目中请直接使用SQL语句返回分页数据！）
        /// </summary>
        /// <returns></returns>
        private DataTable GetPagedDataTable()
        {
            int pageIndex = Grid1.PageIndex;
            int pageSize = Grid1.PageSize;

            DataTable table = DataSourceUtil.GetDataTable2();

            string[] sortFields = Grid1.SortFieldArray;
            // 多列排序
            if (sortFields.Length > 0)
            {
                List<string> sortItems = new List<string>();
                for (var i = 0; i < sortFields.Length; i += 2)
                {
                    sortItems.Add(String.Format("{0} {1}", sortFields[i], sortFields[i + 1]));
                }

                DataView view2 = table.DefaultView;
                view2.Sort = String.Join(", ",  sortItems);

                table = view2.ToTable();
            }

            DataTable paged = table.Clone();

            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > table.Rows.Count)
            {
                rowend = table.Rows.Count;
            }

            for (int i = rowbegin; i < rowend; i++)
            {
                paged.ImportRow(table.Rows[i]);
            }
            
            return paged;
        }

        #endregion

        #region Events

        protected void Grid1_PageIndexChanged(object sender, GridPageEventArgs e)
        {
            BindGrid();
        }

        protected void Grid1_Sort(object sender, GridSortEventArgs e)
        {
            BindGrid();
        }

        #endregion

    }
}
