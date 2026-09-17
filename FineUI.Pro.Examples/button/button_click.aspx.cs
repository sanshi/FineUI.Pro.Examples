using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.button
{
    public partial class button_click : PageBase
    {
        protected void btnServerClick_Click(object sender, EventArgs e)
        {
            ShowNotify("这是服务器端事件");
        }


        protected void btnChangeClientClick2_Click(object sender, EventArgs e)
        {
            // 回发中换掉客户端回调：下发的也只是新函数名，不是脚本
            btnClientClick2.ClickHandler = "onChangedClick";
        }

    }
}
