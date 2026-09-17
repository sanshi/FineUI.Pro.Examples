using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.button
{
    public partial class button_buttongroup_pressgroup : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "ButtonGroupItemPress")
            {
                ShowNotify(GetPressedButton(e.EventArguments));
            }
        }

        private RawHtml GetPressedButton(string buttonGroupID)
        {
            StringBuilder sb = new StringBuilder();

            // 前缀文本与 HTML 列表一起作为可信 HTML 输出
            sb.AppendFormat("分组 {0} 中按下的按钮：", buttonGroupID);

            ButtonGroup theGroup = FindControl(buttonGroupID) as ButtonGroup;

            if (theGroup != null)
            {
                sb.Append("<ul>");
                foreach (Button btn in theGroup.Items)
                {
                    if (btn.Pressed)
                    {
                        sb.AppendFormat("<li>{0}</li>", btn.Text);
                    }
                }
                sb.Append("</ul>");
            }

            return new RawHtml(sb.ToString());
        }

    }
}
