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




        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Action1" || e.CommandName == "Action2")
            {
                ShowNotify(String.Format("你点击了第 {0} 行，第 {1} 列，行命令是 {2}",
                    e.RowIndex + 1, e.ColumnIndex + 1, e.CommandName));
            }
        }


        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "GridCheckChanged")
            {
                JObject arguments = e.EventArgumentsAsJObject;
                GridRow row = Grid1.FindRow(arguments.Value<string>("rowId"));
                bool isChecked = arguments.Value<bool>("isChecked");
                ShowNotify(String.Format("你点击了第 {0} 行，第 {1} 列，选中状态：{2}",
                    row.RowIndex + 1, Grid1.FindColumn("CheckBoxField2").ColumnIndex + 1, isChecked));
            }
            else if (e.EventName == "CheckSelectedRows")
            {
                labResult.Text = GridSelectionMessage.GetCheckStateResult(
                    e.EventArgumentsAsJObject["rows"] as JArray,
                    new string[] { "CheckBoxField2" },
                    new string[] { "是否在校（自动会发）" });
            }
        }


        #endregion


    }
}
