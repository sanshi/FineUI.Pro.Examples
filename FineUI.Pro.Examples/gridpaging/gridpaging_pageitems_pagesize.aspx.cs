using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.gridpaging
{
    public partial class gridpaging_pageitems_pagesize : PageBase
    {

        protected void btnServerPage_Click(object sender, EventArgs e)
        {
            string gridReference = "F(" + Newtonsoft.Json.JsonConvert.SerializeObject(Grid1.ClientID) + ")";
            // WebForms 在分页状态回填后会先刷新绑定数据，需要恢复本次回发采集的排序再切页。
            if (!String.IsNullOrEmpty(Grid1.SortField))
            {
                string field = Newtonsoft.Json.JsonConvert.SerializeObject(Grid1.SortField);
                string direction = Newtonsoft.Json.JsonConvert.SerializeObject(Grid1.SortDirection);
                PageContext.RegisterStartupScript(gridReference + ".loadSortData(" + field + "," + direction + ");");
            }
            PageContext.RegisterStartupScript(gridReference + ".loadPageData(1);");
        }

        protected void btnServerSort_Click(object sender, EventArgs e)
        {
            // 排序针对浏览器已有数据，随后重新切分首页；不重新查询或绑定数据源。
            string gridReference = "F(" + Newtonsoft.Json.JsonConvert.SerializeObject(Grid1.ClientID) + ")";
            PageContext.RegisterStartupScript(gridReference + ".loadSortData('EntranceYear','DESC');" + gridReference + ".loadPageData(0);");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();

                ddlPageSize.SelectedValue = Grid1.PageSize.ToString();
            }
        }

        #region LoadData

        private void BindGrid()
        {
            ViewState["UseDataSource1"] = true;

            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void Button2_Click(object sender, EventArgs e)
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

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            Grid1.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);

        }

        #endregion
    }
}
