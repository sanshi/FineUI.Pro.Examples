using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.gridpaging
{
    public partial class gridpaging_database_more : PageBase
    {
        private static readonly int PAGESIZE = 5;

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
            int pageIndex = Convert.ToInt32(Grid1.AttributeDataTag);

            Grid1.DataSource = GetPagedDataTable(pageIndex, PAGESIZE);
            Grid1.DataBind();
        }

        /// <summary>
        /// 模拟返回总页数
        /// </summary>
        /// <returns></returns>
        private int GetPageCount()
        {
            int recordCount = GetTotalCount();
            int pageCount = recordCount / PAGESIZE;
            if (recordCount % PAGESIZE != 0)
            {
                pageCount += 1;
            }
            return pageCount;
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
        private DataTable GetPagedDataTable(int pageIndex, int pageSize)
        {
            DataTable source = DataSourceUtil.GetDataTable2();

            DataTable paged = source.Clone();

            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > source.Rows.Count)
            {
                rowend = source.Rows.Count;
            }

            for (int i = rowbegin; i < rowend; i++)
            {
                paged.ImportRow(source.Rows[i]);
            }

            return paged;
        }

        #endregion

        #region Events

        private void LoadNextData()
        {
            var pageIndex = Convert.ToInt32(Grid1.AttributeDataTag);
            pageIndex++;

            var pageCount = GetPageCount();
            if (pageIndex <= pageCount - 1)
            {
                // 追加数据
                Grid1.AppendData(GetPagedDataTable(pageIndex, PAGESIZE));

                Grid1.AttributeDataTag = pageIndex.ToString();
            }

            if (pageIndex == pageCount - 1)
            {
                btnMore.Enabled = false;
                btnMore.Text = "全部加载完毕";
            }
        }

        protected void btnMore_Click(object sender, EventArgs e)
        {
            LoadNextData();
        }

        #endregion

    }
}
