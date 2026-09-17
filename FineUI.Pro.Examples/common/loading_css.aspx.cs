using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.common
{
    public partial class loading_css : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }

        }



        private void LoadData()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("<ul class=\"main\">");
            for (int i = 1; i <= 6; i++)
            {
                sb.AppendFormat("<li class=\"\"><div class=\"f-widget-content\"><div class=\"f-loading-css f-loading-css-{0}\"></div></div><div class=\"title\">{0}</div></li>", i);
            }
            sb.Append("</ul>");

            litIcons.Text = sb.ToString();
        }

    }
}
