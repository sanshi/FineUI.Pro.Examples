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
