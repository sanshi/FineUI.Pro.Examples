using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.message
{
    public partial class alert_redirect : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript("alertAndRedirect('点击确定后跳转页面', './alert.aspx');");
        }


    }
}
