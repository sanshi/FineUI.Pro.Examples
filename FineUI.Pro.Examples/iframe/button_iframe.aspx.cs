using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.iframe
{
    public partial class button_iframe : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }

            labResult.Text = "页面加载时间：" + DateTime.Now.ToLongTimeString();
        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            ShowNotify("Window1被关闭了！");
        }

        protected void Window2_Close(object sender, WindowCloseEventArgs e)
        {
            ShowNotify("Window2被关闭了！");
        }
    }
}
