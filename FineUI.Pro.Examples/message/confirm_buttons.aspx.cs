using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.message
{
    public partial class confirm_buttons : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 页面第一次加载
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "ConfirmOK")
            {
                ShowNotify("你点击了[直接退出]按钮！");
            }
            else if (e.EventName == "ConfirmCancel")
            {
                ShowNotify("你点击了[不退出]按钮！");
            }
        }


    }
}
