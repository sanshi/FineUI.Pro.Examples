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
    public partial class grid_checkboxfield_hidesome : PageBase
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

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            // e.DataItem  -> System.Data.DataRowView 或自定义类。
            // e.RowIndex -> 当前行索引。
            // e.Values -> 当前行各列的数据。

            DataRowView row = e.DataItem as DataRowView;


            RenderCheckField atSchoolField = Grid1.FindColumn("AtSchool2") as RenderCheckField;

            // 入学年份
            int entranceYear = Convert.ToInt32(row["EntranceYear"]);
            if (entranceYear <= 2004)
            {
                e.CellCssClasses[atSchoolField.ColumnIndex] = "hidethis";
            }

            
        }


        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Action1" || e.CommandName == "Action2")
            {
                ShowNotify(String.Format("你点击了第 {0} 行，第 {1} 列，行命令是 {2}", e.RowIndex + 1, e.ColumnIndex + 1, e.CommandName));
            }
        }


        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "CheckSelectedRows")
            {
                labResult.Text = GridSelectionMessage.GetCheckStateResult(
                    e.EventArgumentsAsJObject["rows"] as JArray,
                    new string[] { "AtSchool2" },
                    new string[] { "是否在校" });
            }
        }


        #endregion


    }
}
