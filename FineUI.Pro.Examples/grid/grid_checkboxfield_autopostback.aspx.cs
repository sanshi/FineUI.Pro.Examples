using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_checkboxfield_autopostback : PageBase
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


        // 复选框修改完成后，继续执行原来的行内动作；此时后台可以读取修改后的布尔值。
        protected void Grid1_AfterEdit(object sender, GridAfterEditEventArgs e)
        {
            if (e.ColumnID == "CheckBoxField2")
            {
                Grid1_RowCommand(sender, new GridCommandEventArgs(
                    e.RowIndex, e.RowID, e.ColumnIndex, e.ColumnID, "CheckBox1", String.Empty));
            }
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "CheckBox1")
            {
                RenderCheckField checkField = (RenderCheckField)Grid1.FindColumn(e.ColumnIndex);
                bool checkState = GridColumnUtil.GetCheckedState(Grid1, checkField.ColumnID, e.RowIndex);
                ShowNotify(String.Format("你点击了第 {0} 行，第 {1} 列，选中状态：{2}", e.RowIndex + 1, e.ColumnIndex + 1, checkState));
            }
            else if (e.CommandName == "Action1" || e.CommandName == "Action2")
            {
                ShowNotify(String.Format("你点击了第 {0} 行，第 {1} 列，行命令是 {2}", e.RowIndex + 1, e.ColumnIndex + 1, e.CommandName));
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            RenderCheckField field2 = (RenderCheckField)Grid1.FindColumn("CheckBoxField2");

            StringBuilder sb = new StringBuilder();
            List<GridRow> selectedRows = GridSelectionUtil.GetSelectedRows(Grid1);
            int selectedCount = selectedRows.Count;
            if (selectedCount > 0)
            {
                sb.AppendFormat("共选中了 {0} 行：", selectedCount);
                sb.Append("<table class=\"result\">");
                sb.Append("<tr>");
                sb.Append("<th>行号</th>");
                sb.Append("<th>是否在校（自动会发）</th>");
                sb.Append("</tr>");

                for (int i = 0; i < selectedCount; i++)
                {
                    int rowIndex = selectedRows[i].RowIndex;
                    sb.Append("<tr>");

                    sb.AppendFormat("<td>{0}</td>", rowIndex + 1);
                    sb.AppendFormat("<td>{0}</td>", GridColumnUtil.GetCheckedState(Grid1, field2.ColumnID, rowIndex));

                    sb.Append("</tr>");
                }

                sb.Append("</table>");
            }
            else
            {
                sb.Append("<strong>没有选中任何一行！</strong>");
            }

            labResult.Text = sb.ToString();
        }


        #endregion


    }
}
