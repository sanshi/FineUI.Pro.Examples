using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.gridpaging
{
    // https://www.codeproject.com/Articles/16238/GridView-Custom-Paging
    public partial class gridpaging_database_aspnet : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region BindGrid

        private int CurrentPageIndex
        {
            get
            {
                var pageIndexState = ViewState["CurrentPageIndex"];
                if (pageIndexState == null)
                {
                    return 0;
                }
                else
                {
                    return Convert.ToInt32(pageIndexState);
                }
            }
            set
            {
                ViewState["CurrentPageIndex"] = value;
            }
        }
        private const int PAGE_SIZE = 5;

        private int CalculatePageCount(int recordCount)
        {
            int pageCount = recordCount / PAGE_SIZE;
            if (recordCount % PAGE_SIZE != 0)
            {
                pageCount++;
            }
            return pageCount;
        }

        // 更新分页控件状态
        private void UpdatePageControls(int recordCount)
        {
            int pageCount = CalculatePageCount(recordCount);

            lblTotalPages.Text = pageCount.ToString();
            lblCurrentPage.Text = (CurrentPageIndex + 1).ToString();
            if (CurrentPageIndex == 0)
            {
                btnPrevious.Enabled = false;

                if (pageCount > 0)
                {
                    btnNext.Enabled = true;
                }
                else
                {
                    btnNext.Enabled = false;
                }
            }
            else
            {
                btnPrevious.Enabled = true;

                if (CurrentPageIndex == pageCount - 1)
                {
                    btnNext.Enabled = false;
                }
                else
                {
                    btnNext.Enabled = true;
                }
            }
        }

        private void BindGrid()
        {
            // 1.设置总项数
            int recordCount = GetTotalCount();

            // 2.获取当前分页数据
            DataTable table = GetPagedDataTable(CurrentPageIndex, PAGE_SIZE);

            // 3.绑定到Grid
            Grid1.DataSource = table;
            Grid1.DataBind();

            UpdatePageControls(recordCount);
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

        protected void OnPageButtonClick(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Previous":
                    CurrentPageIndex--;
                    break;
                case "Next":
                    CurrentPageIndex++;
                    break;
            }

            BindGrid();
        }

        #endregion
    }
}
