using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.message
{
    public partial class confirm_cancel : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Operation2Confirm")
            {
                ShowNotify("执行了操作二！");
            }
            else if (e.EventName == "Operation3Confirm")
            {
                ShowNotify("执行了操作三！");
            }
            else if (e.EventName == "Operation3Cancel")
            {
                ShowNotify("取消执行操作三！");
            }
        }

        protected void btnOperation1_Click(object sender, EventArgs e)
        {
            ShowNotify("执行了操作一！");
        }

    }
}
