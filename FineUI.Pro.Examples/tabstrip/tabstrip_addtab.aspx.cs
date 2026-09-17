using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.tabstrip
{
    public partial class tabstrip_addtab : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void btnAddTab3_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetAddTabReference("dynamic_tab3", "https://deepseek.com/", "DeepSeek官网（服务端代码）", IconHelper.GetIconUrl(Icon.Application), true));
        }

        protected void btnAddTab4_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetAddTabReference("dynamic_tab4", "https://asp.net/", "ASP.NET官网（服务端代码）", IconHelper.GetIconUrl(Icon.ApplicationAdd), true));
        }

        protected void btnRemoveTab3_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetCloseTabReference("dynamic_tab3"));
        }

        protected void btnRemoveTab4_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetCloseTabReference("dynamic_tab4"));
        }
    }
}
