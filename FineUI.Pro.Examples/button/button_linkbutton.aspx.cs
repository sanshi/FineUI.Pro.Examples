using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.button
{
    public partial class button_linkbutton : PageBase
    {
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            ShowNotify("这是服务器端事件");
        }

        protected void btnChangeEnable_Click(object sender, EventArgs e)
        {
            LinkButton1.Enabled = !LinkButton1.Enabled;
        }

    }
}
