using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_multiactions_column_menubutton : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            JObject param;
            if (e.EventName == "Grid1_CustomDelete")
            {
                param = e.EventArgumentsAsJObject;
                ShowNotify(String.Format("你点击了第 {0} 行的删除按钮，行ID：{1}，姓名：{2}",
                    param.Value<int>("rowIndex") + 1, param.Value<string>("rowId"), param.Value<string>("rowText")));
            }
            else if (e.EventName == "Grid1_CustomEdit")
            {
                param = e.EventArgumentsAsJObject;
                ShowNotify(String.Format("你点击了第 {0} 行的菜单项 {3}，行ID：{1}，姓名：{2}",
                    param.Value<int>("rowIndex") + 1, param.Value<string>("rowId"),
                    param.Value<string>("rowText"), param.Value<string>("actionName")));
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            ViewState["UseDataSource1"] = true;

            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }


        #endregion

        #region Events


        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable table;
            if (Convert.ToBoolean(ViewState["UseDataSource1"]))
            {
                ViewState["UseDataSource1"] = false;
                table = DataSourceUtil.GetDataTable2();
            }
            else
            {
                ViewState["UseDataSource1"] = true;
                table = DataSourceUtil.GetDataTable();
            }

            Grid1.DataSource = table;
            Grid1.DataBind();
        }


        protected void Window1_Close(object sender, EventArgs e)
        {

        }

        #endregion

    }
}
