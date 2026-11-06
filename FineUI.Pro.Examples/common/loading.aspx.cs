using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.common
{
    public partial class loading : PageBase
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

            sb.Append("<ul class=\"loading\">");
            for (int i = 1; i <= 30; i++)
            {
#pragma warning disable CS0618 // 此页专门展示旧版 GIF 与编号的对应关系。
                string imageUrl = PageManager1.GetEmbedLoadingImageUrl(i);
#pragma warning restore CS0618

                sb.AppendFormat("<li class=\"f-widget-content\"><img src=\"{0}\"><div class=\"title\">{1}</div></li>", imageUrl, i);
            }
            sb.Append("</ul>");

            litIcons.Text = sb.ToString();
        }

    }
}
