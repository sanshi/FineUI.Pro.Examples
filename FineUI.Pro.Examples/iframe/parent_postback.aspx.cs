using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.iframe
{
    public partial class parent_postback : PageBase
    {
        protected void btnServerRefresh_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Panel1.GetRefreshIFrameReference());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            labResult.Text = "页面加载时间：" + DateTime.Now.ToLongTimeString();
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Test3WindowClose")
            {
                //Button1.Text = "更新时间：" + DateTime.Now.ToLongTimeString();
            }
        }
    }
}
