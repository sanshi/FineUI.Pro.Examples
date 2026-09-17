using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.mobile
{
    public partial class _default : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string file = Request.QueryString["file"];

                // 如果不带参数访问此页面，则转到main.aspx
                if (String.IsNullOrEmpty(file))
                {
                    Response.Redirect("~/mobile/main.aspx");
                    return;
                }

                string resolvedUrl = ResolveClientUrl(file);
                if (Request.Browser.IsMobileDevice)
                {
                    Response.Redirect(resolvedUrl);
                }

                litIFrame.Text = String.Format("<iframe class=\"f-iframe myiframe f-widget-content\" id=\"myiframe\" src=\"{0}\"></iframe>", resolvedUrl);
                
            }

        }

    }
}
