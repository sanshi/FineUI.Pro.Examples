using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace FineUI.Pro.Examples.config
{
    public partial class iconfont : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }

        }


        private static string LI_TEMPLATE = "<li class=\"f-state-default\"><i class=\"f-icon f-iconfont {0}\"></i><div class=\"title\">{1}</div><div class=\"subtitle\">{2}</div></li>";

        private void LoadData()
        {

            StringBuilder sb = new StringBuilder();

            string iconName = String.Empty;

            sb.Append("<ul class=\"icons\">");
            sb.AppendFormat(LI_TEMPLATE, "", "None", "&nbsp;");
            foreach (string icon in Enum.GetNames(typeof(IconFont)))
            {
                // 以下划线开头的是IconFont字体
                if (!icon.StartsWith("_"))
                {
                    continue;
                }

                IconFont iconType = (IconFont)Enum.Parse(typeof(IconFont), icon);


                iconName = IconFontHelper.GetName(iconType);

                var shortIconName = iconName;
                if (shortIconName.StartsWith("f-iconfont-"))
                {
                    shortIconName = shortIconName.Substring("f-iconfont-".Length);
                }

                sb.AppendFormat(LI_TEMPLATE, iconName, icon, shortIconName);
            }
            sb.Append("</ul>");

            litIcons.Text = sb.ToString();
        }

    }
}
