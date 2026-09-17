using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_rowcheckall : PageBase
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

        protected void Grid1_RowClick(object sender, GridRowClickEventArgs e)
        {
            //Notify(String.Format("你点击了第 {0} 行（单击）", e.RowIndex + 1));

            bool checkedState = false;
            string rowID = Grid1.Rows[e.RowIndex].RowID;
            if (GridSelectionUtil.IsRowSelected(Grid1, rowID))
            {
                checkedState = true;
            }

            CheckBoxField field1 = (CheckBoxField)Grid1.FindColumn("CheckBoxField1");
            CheckBoxField field2 = (CheckBoxField)Grid1.FindColumn("CheckBoxField2"); 
            CheckBoxField field3 = (CheckBoxField)Grid1.FindColumn("CheckBoxField3");
            
            // Grid1.Rows[e.RowIndex].States[field1.ColumnIndex] = true;
            field1.SetCheckedState(e.RowIndex, checkedState);
            field2.SetCheckedState(e.RowIndex, checkedState);
            field3.SetCheckedState(e.RowIndex, checkedState);
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            CheckBoxField field1 = (CheckBoxField)Grid1.FindColumn("CheckBoxField1");
            CheckBoxField field2 = (CheckBoxField)Grid1.FindColumn("CheckBoxField2");
            CheckBoxField field3 = (CheckBoxField)Grid1.FindColumn("CheckBoxField3");

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
                    sb.AppendFormat("<td>{0}</td>", field1.GetCheckedState(rowIndex));
                    sb.AppendFormat("<td>{0}</td>", field2.GetCheckedState(rowIndex));
                    sb.AppendFormat("<td>{0}</td>", field3.GetCheckedState(rowIndex));

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
