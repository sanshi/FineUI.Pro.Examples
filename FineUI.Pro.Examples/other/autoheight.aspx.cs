using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.other
{
    public partial class autoheight : PageBase
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
            string LITEMPLATE = "<li><img src=\"../res/images/mm/{0}\"></img></li>";
            StringBuilder sb = new StringBuilder();
            sb.Append("<ul class=\"mmlist\">");
            sb.AppendFormat(LITEMPLATE, "1.jpg");
            sb.AppendFormat(LITEMPLATE, "2.jpg");
            sb.AppendFormat(LITEMPLATE, "3.jpg");
            sb.AppendFormat(LITEMPLATE, "4.jpg");
            sb.Append("</ul>");

            string imagesHtml = sb.ToString();
            Label1.Text = imagesHtml;
            Label2.Text = imagesHtml;
        }

    }
}
