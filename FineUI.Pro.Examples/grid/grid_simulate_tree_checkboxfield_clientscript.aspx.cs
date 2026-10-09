using System;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_simulate_tree_checkboxfield_clientscript : PageBase
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
            DataTable table = IniGrid();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        private static DataTable IniGrid()
        {
            DataTable table = new DataTable();
            DataColumn column1 = new DataColumn("Id", typeof(int));
            DataColumn column2 = new DataColumn("Name", typeof(String));
            DataColumn column3 = new DataColumn("Group", typeof(String));
            DataColumn column4 = new DataColumn("TreeLevel", typeof(int));
            table.Columns.Add(column1);
            table.Columns.Add(column2);
            table.Columns.Add(column3);
            table.Columns.Add(column4);

            DataRow row = table.NewRow();
            row[0] = 101;
            row[1] = "中国";
            row[2] = "1";
            row[3] = 0;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 102;
            row[1] = "河南省";
            row[2] = "2";
            row[3] = 1;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 103;
            row[1] = "驻马店市";
            row[2] = "3";
            row[3] = 2;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 104;
            row[1] = "漯河市";
            row[2] = "3";
            row[3] = 2;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 105;
            row[1] = "安徽省";
            row[2] = "2";
            row[3] = 1;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 106;
            row[1] = "合肥市";
            row[2] = "3";
            row[3] = 2;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 107;
            row[1] = "黄山市";
            row[2] = "3";
            row[3] = 2;
            table.Rows.Add(row);


            return table;
        }

        #endregion

        #region Events

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName != "GridRowCommand")
            {
                return;
            }
            JObject arguments = e.EventArgumentsAsJObject;
            GridRow row = Grid1.FindRow(arguments.Value<string>("rowId"));
            if (row == null)
            {
                throw new HttpException(400, "找不到指定的表格行。");
            }
            if (e.EventName == "GridRowCommand")
            {
                string commandName = arguments.Value<string>("commandName");
                if (commandName != "Action1" && commandName != "Action2")
                {
                    return;
                }
                int columnIndex = Grid1.FindColumn(arguments.Value<string>("columnId")).ColumnIndex;
                bool isChecked = arguments.Value<bool>("isChecked");
                labResult.Text = String.Format("你点击了第 {0} 行，第 {1} 列，行命令是 {2}",
                    row.RowIndex + 1, columnIndex + 1, commandName) + "<br />" +
                    String.Format("当前行数据 - 编号：{0}，姓名：{1}，复选框列：{2}",
                        row.DataKeys[0], HtmlEncode(Convert.ToString(row.DataKeys[1])), isChecked);
            }
        }

        #endregion

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            DataRowView row = e.DataItem as DataRowView;
            int rowDataId = Convert.ToInt32(row["Id"]);

            // 绑定期间直接设置行的初始选中值，避免在全部行完成之前读取不完整的合并数据。
            if (rowDataId == 105 || rowDataId == 106 || rowDataId == 107)
            {
                RenderCheckField checkField = (RenderCheckField)Grid1.FindColumn("CheckBoxField1");
                e.Row.SetCellValue(checkField.ColumnID, true);
            }
        }

    }
}
