using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.iframe
{
    public partial class parent_simplepostback : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            labResult.Text = "页面加载时间：" + DateTime.Now.ToLongTimeString();
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "IFrameButtonClick")
            {
                ShowNotify("来自IFrame中的事件！");
            }
        }


    }
}
