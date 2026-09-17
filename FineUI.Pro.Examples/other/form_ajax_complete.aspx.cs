using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.other
{
    public partial class form_ajax_complete : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "SubmitForm1")
            {
                // 为了观察前台动画，后台休眠 1 秒钟
                System.Threading.Thread.Sleep(1000);

                ShowNotify("表单验证并提交成功！");
            }
        }


    }
}
