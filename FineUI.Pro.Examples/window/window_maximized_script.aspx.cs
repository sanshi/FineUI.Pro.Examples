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
