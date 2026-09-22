using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.window
{
    public partial class window_maximized_script : PageBase
    {
        protected void btnServerMaximize_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window1.GetMaximizeReference());
        }

        protected void btnServerRestore_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Window1.GetRestoreReference());
        }

        protected void btnServerClose_Click(object sender, EventArgs e)
        {
            // 对渲染后的控件 ID 做 JSON 转义，再调用可取消的客户端关闭流程。
            string windowId = Newtonsoft.Json.JsonConvert.SerializeObject(Window1.ClientID);
            PageContext.RegisterStartupScript("F(" + windowId + ").close();");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 窗体初始最大化
                PageContext.RegisterStartupScript(Window1.GetShowReference() + Window1.GetMaximizeReference());
            }
        }
    }
}
