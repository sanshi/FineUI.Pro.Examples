using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.iframe
{
    public partial class window_iframe : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 说明文字内含图片链接，在服务端补全应用地址，避免在控件属性中写入 ASPX 表达式。
                Label2.Text = String.Format(Label2.Text, PageContext.ResolveUrl("~/res/images/formchangeconfirm.png"));

            }
        }

        protected void btnClosePostBack_Click(object sender, EventArgs e)
        {
            // 首先保存数据

            // 然后关闭本窗体
            PageContext.RegisterStartupScript(Panel1.GetClearDirtyReference() + ActiveWindow.GetHidePostBackReference());
        }
    }
}
