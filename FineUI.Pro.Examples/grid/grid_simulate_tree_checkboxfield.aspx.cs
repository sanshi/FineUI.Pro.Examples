using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_simulate_tree_checkboxfield : PageBase
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

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            // 当前行[复选框]列的选中状态
            CheckBoxField checkField = (CheckBoxField)Grid1.FindColumn("CheckBoxField1"); 
            bool crowCheckState = checkField.GetCheckedState(e.RowIndex);

            if (e.CommandName == "Action1" || e.CommandName == "Action2")
            {
                object[] keys = Grid1.DataKeys[e.RowIndex];
                labResult.Text = String.Format("你点击了第 {0} 行，第 {1} 列，行命令是 {2}", e.RowIndex + 1, e.ColumnIndex + 1, e.CommandName) +
                       "<br />" +
                       String.Format("当前行数据 - 编号：{0}，姓名：{1}，复选框列：{2}", keys[0], keys[1], crowCheckState);
            }
            else if (e.CommandName == "CheckBox1")
            {
                // 当前行的TreeLevel
                int crowTreeLevel = Convert.ToInt32(Grid1.DataKeys[e.RowIndex][2]);
                //Notify(String.Format("你点击了第 {0} 行，第 {1} 列，选中状态：{2}", e.RowIndex + 1, e.ColumnIndex + 1, checkState));

                for (int i = e.RowIndex + 1, count = Grid1.DataKeys.Count; i < count; i++)
                {
                    int treeLevel = Convert.ToInt32(Grid1.DataKeys[i][2]);

                    // 当前行的子级（TreeLevel大于当前行的TreeLevel）
                    if (treeLevel > crowTreeLevel)
                    {
                        checkField.SetCheckedState(i, crowCheckState);
                    }
                    else
                    {
                        // 跳出子级
                        break;
                    }
                }

            }
        }

        #endregion

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            DataRowView row = e.DataItem as DataRowView;
            int rowDataId = Convert.ToInt32(row["Id"]);

            // 默认展开的节点
            if (rowDataId == 105 || rowDataId == 106 || rowDataId == 107)
            {
                CheckBoxField checkField = (CheckBoxField)Grid1.FindColumn("CheckBoxField1");
                checkField.SetCheckedState(e.RowIndex, true);
            }
        }

    }
}
