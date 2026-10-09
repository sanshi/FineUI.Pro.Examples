using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_checkboxfield_rowcheckall : PageBase
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            RenderCheckField field1 = (RenderCheckField)Grid1.FindColumn("CheckBoxField1");
            RenderCheckField field2 = (RenderCheckField)Grid1.FindColumn("CheckBoxField2");
            RenderCheckField field3 = (RenderCheckField)Grid1.FindColumn("CheckBoxField3");

            StringBuilder sb = new StringBuilder();
            List<GridRow> selectedRows = GridSelectionUtil.GetSelectedRows(Grid1);
            int selectedCount = selectedRows.Count;
            if (selectedCount > 0)
            {
                sb.AppendFormat("共选中了 {0} 行：", selectedCount);
                sb.Append("<table class=\"result\">");
                sb.Append("<tr>");
                sb.Append("<th>行号</th>");
                sb.Append("<th>是否在校1</th>");
                sb.Append("<th>是否在校2</th>");
                sb.Append("<th>是否在校3</th>");
                sb.Append("</tr>");

                for (int i = 0; i < selectedCount; i++)
                {
                    int rowIndex = selectedRows[i].RowIndex;
                    sb.Append("<tr>");

                    sb.AppendFormat("<td>{0}</td>", rowIndex + 1);
                    sb.AppendFormat("<td>{0}</td>", GridColumnUtil.GetCheckedState(Grid1, field1.ColumnID, rowIndex));
                    sb.AppendFormat("<td>{0}</td>", GridColumnUtil.GetCheckedState(Grid1, field2.ColumnID, rowIndex));
                    sb.AppendFormat("<td>{0}</td>", GridColumnUtil.GetCheckedState(Grid1, field3.ColumnID, rowIndex));

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


        

        private void ChangeCheckBoxStatus(bool checkedState)
        {
            RenderCheckField field1 = (RenderCheckField)Grid1.FindColumn("CheckBoxField1");
            RenderCheckField field2 = (RenderCheckField)Grid1.FindColumn("CheckBoxField2");
            RenderCheckField field3 = (RenderCheckField)Grid1.FindColumn("CheckBoxField3");


            foreach (GridRow row in GridSelectionUtil.GetSelectedRows(Grid1))
            {
                int rowIndex = row.RowIndex;
                GridColumnUtil.SetCheckedState(Grid1, field1.ColumnID, rowIndex, checkedState);
                GridColumnUtil.SetCheckedState(Grid1, field2.ColumnID, rowIndex, checkedState);
                GridColumnUtil.SetCheckedState(Grid1, field3.ColumnID, rowIndex, checkedState);
            }

        }


        protected void btnSelectRows_Click(object sender, EventArgs e)
        {
            ChangeCheckBoxStatus(true);
        }

        protected void btnUnselectRows_Click(object sender, EventArgs e)
        {
            ChangeCheckBoxStatus(false);
        }

        #endregion

    }
}
