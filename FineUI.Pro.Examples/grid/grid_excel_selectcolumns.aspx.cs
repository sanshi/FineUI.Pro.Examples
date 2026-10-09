using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using AspNet = System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.data
{
    public partial class grid_excel_selectcolumns : PageBase
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

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=MyExcelFile.xls");
            Response.ContentType = "application/vnd.ms-excel";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(GetGridTableHtml(Grid1, e.CloseArgument.Split('#')));
            Response.End();
        }

        private string GetGridTableHtml(Grid grid, string[] columns)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<meta http-equiv=\"Content-Type\" content=\"application/vnd.ms-excel;charset=utf-8\"/>");
            sb.Append("<table cellspacing=\"0\" rules=\"all\" border=\"1\" style=\"border-collapse:collapse;\">");

            List<GridColumn> exportColumns = new List<GridColumn>();
            List<string> selectedHeaders = new List<string>(columns);
            foreach (GridColumn column in grid.Columns)
            {
                if (!selectedHeaders.Contains(column.HeaderText))
                {
                    continue;
                }
                exportColumns.Add(column);
            }

            sb.Append("<tr>");
            foreach (GridColumn column in exportColumns)
            {
                sb.AppendFormat("<td>{0}</td>", HttpUtility.HtmlEncode(column.HeaderText));
            }
            sb.Append("</tr>");

            foreach (GridRow row in grid.Rows)
            {
                sb.Append("<tr>");
                foreach (GridColumn column in exportColumns)
                {
                    // 导出使用列的显示格式，不能把性别 0/1、布尔值和原始日期直接写进文件。
                    sb.AppendFormat("<td>{0}</td>", GridExportUtil.GetCellHtml(row, column, this));
                }
                sb.Append("</tr>");
            }
            sb.Append("</table>");
            return sb.ToString();
        }

        #endregion
    }
}
