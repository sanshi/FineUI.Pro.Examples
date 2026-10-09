using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_excel_rowcommand_download : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        #region LoadData

        private void LoadData()
        {
            BindGrid();
        }

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }

        #endregion

        #region Events

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName != "DownloadRow")
            {
                return;
            }
            // 按稳定行 ID 找回服务端数据，下载仍使用原行号、列号和文件内容。
            GridRow row = Grid1.FindRow(e.EventArguments);
            if (row != null)
            {
                GridColumn column = Grid1.FindColumn("Action2");
                Grid1_RowCommand(sender, new GridCommandEventArgs(
                    row.RowIndex, row.RowID, column.ColumnIndex, column.ColumnID, "Action2", String.Empty));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            labResult.Text = GridSelectionMessage.HowManyRowsAreSelected(Grid1);
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            object[] keys = Grid1.DataKeys[e.RowIndex];
            string result = String.Format("你点击了第 {0} 行，第 {1} 列，行命令是 {2}", e.RowIndex + 1, e.ColumnIndex + 1, e.CommandName) +
                       "<br>" +
                       String.Format("当前行数据 - 编号：{0}，姓名：{1}", keys[0], keys[1]);

            if (e.CommandName == "Action1")
            {
                // AJAX回发
                labResult.Text = result;
            }
            else if (e.CommandName == "Action2")
            {
                result = result.Replace("<br>", "\r\n");

                // 非AJAX回发
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment; filename=row_" + e.RowIndex + ".txt");
                Response.ContentType = "text/plain";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.Write(result);
                Response.End();
            }
        }

        #endregion
    }
}
