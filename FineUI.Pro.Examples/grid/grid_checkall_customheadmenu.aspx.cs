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
    public partial class grid_checkall_customheadmenu : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Grid1.CheckBoxSelectWidth = 60;
                Grid1.CheckBoxSelectHeaderTextRawHtml = new RawHtml("<i class=\"f-icon f-iconfont f-grid-checkbox f-checkbox\"></i><i class=\"f-icon f-iconfont f-iconfont-arrow-down custom-arrow-down\"></i>");

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

        #region Event

        /// <summary>
        /// 选中了哪些行
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            foreach (object[] dataKeys in Grid1.GetSelectedDataKeys())
            {
                sb.AppendFormat("用户名:{0}<br />", dataKeys[1]);
            }
            labResult.Text = sb.ToString();
        }


        #endregion

    }
}
