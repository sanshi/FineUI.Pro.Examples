using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.iframe
{
    public partial class iframe_closeall_window1 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }

            labResult.Text = "页面加载时间：" + DateTime.Now.ToLongTimeString();
        }

        protected void btnPostBackClose_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(FineUI.Pro.ActiveWindow.GetHidePostBackReference());
        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            PageContext.RegisterStartupScript(FineUI.Pro.ActiveWindow.GetHidePostBackReference());
        }

        protected void Window2_Close(object sender, WindowCloseEventArgs e)
        {
            PageContext.RegisterStartupScript(FineUI.Pro.ActiveWindow.GetHidePostBackReference());
        }
    }
}
