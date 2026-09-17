using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.message
{
    public partial class notify_addtab : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnOperation1_Click1(object sender, EventArgs e)
        {
            // 随机生成通知对话框的客户端ID
            string notifyId = Guid.NewGuid().ToString();

            Notify n = new Notify();
            n.ID = notifyId;
            n.MessageRawHtml = new RawHtml("<div class=\"addtabcontainer\"><a href=\"javascript:openExampleHello('" + notifyId + "');\">向父页面添加选项卡</a></div>");
            n.MessageBoxIcon = MessageBoxIcon.None;
            n.PositionX = Position.Right;
            n.PositionY = Position.Bottom;
            n.DisplayMilliseconds = 0;
            n.ShowHeader = false;

            n.Show();
        }

    }
}
