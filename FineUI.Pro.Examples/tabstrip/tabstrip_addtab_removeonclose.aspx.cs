using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.tabstrip
{
    public partial class tabstrip_addtab_removeonclose : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void btnAddTab3_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetAddTabReference(new TabOptions()
            {
                ID = "dynamic_tab3",
                IFrameUrl = "https://deepseek.com/",
                Title = "DeepSeek官网（服务端代码）",
                IconUrl = IconHelper.GetIconUrl(Icon.Application),
                EnableClose = true,
                RemoveOnClose = true
            }));
        }

        protected void btnAddTab4_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(TabStrip1.GetAddTabReference(new TabOptions() {
                ID = "dynamic_tab4",
                IFrameUrl = "https://asp.net/",
                Title = "ASP.NET官网（服务端代码）",
                IconUrl = IconHelper.GetIconUrl(Icon.ApplicationAdd),
                EnableClose = true,
                RemoveOnClose = true
            }));
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
