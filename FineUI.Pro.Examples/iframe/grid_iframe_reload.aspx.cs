using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.iframe
{
    public partial class grid_iframe_reload : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //System.Threading.Thread.Sleep(3000);
            if (!IsPostBack)
            {
                AutoBindGrid();

                Panel7.Title = "表格 - 页面加载时间：" + DateTime.Now.ToLongTimeString();
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "ReloadGrid")
            {
                AutoBindGrid();
                Panel7.Title = "表格 - 回发参数：" + e.EventArguments;
            }
        }

        #region BindGrid

        private void AutoBindGrid()
        {
            if (ViewState["BindGrid1"] != null && Convert.ToBoolean(ViewState["BindGrid1"]))
            {
                BindGrid();
                ViewState["BindGrid1"] = false;
            }
            else
            {
                BindGrid2();
                ViewState["BindGrid1"] = true;
            }
        }

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid2.DataSource = table;
            Grid2.DataBind();
        }

        private void BindGrid2()
        {
            DataTable table = DataSourceUtil.GetDataTable2();

            Grid2.DataSource = table;
            Grid2.DataBind();
        }

        #endregion

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void Grid2_Sort(object sender, GridSortEventArgs e)
        {
            ShowNotify(e.SortField);
        }


        protected void ttbSearch_Trigger1Click(object sender, EventArgs e)
        {
            AutoBindGrid();

            ttbSearch.Text = String.Empty;
            ttbSearch.ShowTrigger1 = false;

        }

        protected void ttbSearch_Trigger2Click(object sender, EventArgs e)
        {
            AutoBindGrid();

            ttbSearch.ShowTrigger1 = true;
        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            AutoBindGrid();

            Panel7.Title = "表格 - 回发参数：Window1_Close";
        }

    }
}
