using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.gridpaging
{
    public partial class gridpaging_pageitems : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region LoadData

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable2();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }

        #endregion

        #region Events

        protected void btnSelectAll_Click(object sender, EventArgs e)
        {
            Grid1.SelectAllRows();
        }

        protected void btnClearSelect_Click(object sender, EventArgs e)
        {
            Grid1.SelectedRowIDArray = null;
        }

        protected void btnClearData_Click(object sender, EventArgs e)
        {
            // 方法一
            Grid1.DataSource = null;
            Grid1.DataBind();

            //// 方法二
            //DataTable table = DataSourceUtil.GetEmptyDataTable();
            //Grid1.DataSource = table;
            //Grid1.DataBind();
        }

        protected void btnRebindData_Click(object sender, EventArgs e)
        {
            BindGrid();

           
        }
        

        #endregion
    }
}
