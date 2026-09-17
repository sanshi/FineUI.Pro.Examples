using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.griddataurl
{
    public partial class griddataurl_selectrows : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 网址数据源模式下也应按稳定行ID设置选中项。
                Grid1.SelectedRowIDArray = new string[] { "105", "110" };
            }
        }


        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            labResult.Text = "选中的行ID：" + String.Join(", ", Grid1.SelectedRowIDArray);
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            // 网址数据源模式下也应按稳定行ID设置选中项。
            Grid1.SelectedRowIDArray = new string[] { "102", "106", "108" };
        }

        #endregion

    }
}
