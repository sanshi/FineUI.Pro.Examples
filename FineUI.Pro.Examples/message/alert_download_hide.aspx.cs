using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.message
{
    public partial class alert_download_hide : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "ConfirmCancel")
            {
                ShowNotify("点击了取消按钮！");
            }
        }

        protected void btnOperation_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window1.GetHideReference() +
                Confirm.GetShowReference("操作成功！点击确定按钮开始下载文件，点取消按钮弹出对话框",
                    String.Empty,
                    MessageBoxIcon.Question,
                    "confirmOKCallback();",
                    "confirmCancelCallback();"));
        }

    }
}
