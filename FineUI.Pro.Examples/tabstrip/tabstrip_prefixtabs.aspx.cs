using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.tabstrip
{
    public partial class tabstrip_prefixtabs : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetAddTabReference("tab1_iframe", "https://deepseek.com/", "DeepSeek官网", true));
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetAddTabReference("tab1_iframe", "https://asp.net/", "ASP.NET官网", true));
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetAddTabReference("tab2_iframe", "https://fineui.com/", "FineUI官网", true));
        }

        

    }
}
