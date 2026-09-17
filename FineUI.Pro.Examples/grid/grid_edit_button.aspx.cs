using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_edit_button : PageBase
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


        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.Button btn = (System.Web.UI.WebControls.Button)sender;

            // 获取点击按钮所在的行索引
            int rowIndex = (btn.NamingContainer as IDataItemContainer).DisplayIndex;

            // 从 DataKeys 获取行数据
            labResult.Text = String.Format("你要删除的行索引：{0}，ID：{1}，用户名：{2}", rowIndex, Grid1.DataKeys[rowIndex][0], Grid1.DataKeys[rowIndex][1]);

        }

        #endregion


    }
}
