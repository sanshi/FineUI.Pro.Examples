using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.window
{
    public partial class window : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //PageContext.RegisterStartupScript(Window2.GetShowReference(300, 300));

            }
        }

        protected void btnShowInServer_Click(object sender, EventArgs e)
        {
            Window2.Hidden = false;
        }

        protected void btnHideInServer_Click(object sender, EventArgs e)
        {
            Window2.Hidden = true;
        }

        protected void Window2_Close(object sender, WindowCloseEventArgs e)
        {
            ShowNotify("窗体被关闭了。参数：" + (String.IsNullOrEmpty(e.CloseArgument) ? "无" : e.CloseArgument));
        }

        protected void btnSubmitForm1_Click(object sender, EventArgs e)
        {

        }

    }
}
