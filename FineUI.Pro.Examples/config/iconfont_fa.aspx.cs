using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace FineUI.Pro.Examples.config
{
    public partial class iconfont_fa : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }

        }


        private static string LI_TEMPLATE = "<li class=\"f-state-default\"><i class=\"f-icon {0}\"></i><div class=\"title\">{1}</div><div class=\"subtitle\">{2}</div></li>";


        private void LoadData()
        {
            StringBuilder sb = new StringBuilder();

            string iconName = String.Empty;
            string iconClassName = String.Empty;

            sb.Append("<ul class=\"icons\">");
            foreach (string icon in Enum.GetNames(typeof(IconFont)))
            {
                // 以下划线开头的是IconFont字体
                if (icon.StartsWith("_"))
                {
                    continue;
                }

                IconFont iconType = (IconFont)Enum.Parse(typeof(IconFont), icon);

                if (iconType != IconFont.None)
                {
                    iconName = IconFontHelper.GetName(iconType);
                    iconClassName = "f-icon-" + iconName;
                }

                sb.AppendFormat(LI_TEMPLATE,
                    iconClassName, icon, String.IsNullOrEmpty(iconName) ? "&nbsp;" : iconName);
            }
            sb.Append("</ul>");

            litIcons.Text = sb.ToString();
        }

    }
}
