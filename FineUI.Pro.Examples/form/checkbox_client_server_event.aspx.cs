using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class checkbox_client_server_event : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void CheckBox1_CheckedChanged(object sender, CheckedEventArgs e)
        {
            labResult.Text = "【服务端】复选框1的状态：" + (CheckBox1.Checked ? "选中" : "未选中");
        }


        protected void CheckBox2_CheckedChanged(object sender, CheckedEventArgs e)
        {
            labResult.Text = "【服务端】复选框2的状态：" + (CheckBox1.Checked ? "选中" : "未选中");
        }

    }
}