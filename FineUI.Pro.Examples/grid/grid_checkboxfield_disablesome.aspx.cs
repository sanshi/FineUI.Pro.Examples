using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_checkboxfield_disablesome : PageBase
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

        protected void Grid1_PreRowDataBound(object sender, GridPreRowEventArgs e)
        {
            // e.DataItem  -> System.Data.DataRowView or custom class.
            // e.RowIndex -> Current row index.
            // e.Values -> Rendered html for each column of this row.

            DataRowView row = e.DataItem as DataRowView;


            CheckBoxField atSchoolField = Grid1.FindColumn("AtSchool2") as CheckBoxField;

            // 入学年份
            int entranceYear = Convert.ToInt32(row["EntranceYear"]);
            if (entranceYear <= 2004)
            {
                atSchoolField.Enabled = false;
            }
            else
            {
                atSchoolField.Enabled = true;
            }

        }


        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Action1" || e.CommandName == "Action2")
            {
                ShowNotify(String.Format("你点击了第 {0} 行，第 {1} 列，行命令是 {2}", e.RowIndex + 1, e.ColumnIndex + 1, e.CommandName));
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            CheckBoxField field1 = (CheckBoxField)Grid1.FindColumn("AtSchool2");

            StringBuilder sb = new StringBuilder();
            List<GridRow> selectedRows = GridSelectionUtil.GetSelectedRows(Grid1);
            int selectedCount = selectedRows.Count;
            if (selectedCount > 0)
            {
                sb.AppendFormat("共选中了 {0} 行：", selectedCount);
                sb.Append("<table class=\"result\">");
                sb.Append("<tr>");
                sb.Append("<th>行号</th>");
                sb.Append("<th>是否在校</th>");
                sb.Append("</tr>");

                for (int i = 0; i < selectedCount; i++)
                {
                    int rowIndex = selectedRows[i].RowIndex;
                    sb.Append("<tr>");

                    sb.AppendFormat("<td>{0}</td>", rowIndex + 1);
                    sb.AppendFormat("<td>{0}</td>", field1.GetCheckedState(rowIndex));

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
