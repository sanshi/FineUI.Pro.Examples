using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_rowdatabound_emptycell : PageBase
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
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        /// <summary>
        /// 这个事件会在渲染每一行后调用，此时 Values 属性保存了每一项渲染后的 HTML 片段
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            // e.DataItem  -> System.Data.DataRowView 或者自定义类
            // e.RowIndex -> 当前行序号（从 0 开始）
            // e.Values -> 当前行每一列渲染后的 HTML 片段

            DataRowView row = e.DataItem as DataRowView;
            int year = Convert.ToInt32(row["EntranceYear"]);

            if(year == 2008)
            {
                // 如果入学年份是 2008，则清空一些列的值
                e.SetCellValue("lbfAction2", null);
                e.SetCellValue("cbfAtSchool", null);
            }
            
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Action1" || e.CommandName == "Action2")
            {
                labResult.Text = String.Format("你点击了第 {0} 行，第 {1} 列，行命令是 {2}", e.RowIndex + 1, e.ColumnIndex + 1, e.CommandName);
            }
        }

        #endregion

    }
}
