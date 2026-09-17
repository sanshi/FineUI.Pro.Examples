using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.panel
{
    public partial class panel_autoheight : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                labContent.Text = ".NET 企业级全栈 UI 框架<br/>.NET 企业级全栈 UI 框架<br/>.NET 企业级全栈 UI 框架<br/>.NET 企业级全栈 UI 框架<br/>.NET 企业级全栈 UI 框架<br/>.NET 企业级全栈 UI 框架";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            labContent.Text += "<br/>.NET 企业级全栈 UI 框架";
        }


        protected void Button4_Click(object sender, EventArgs e)
        {
            List<string> lines = new List<string>( labContent.Text.Split(new string[] { "<br/>" }, StringSplitOptions.None));
            lines.RemoveAt(lines.Count - 1);

            labContent.Text = String.Join("<br/>", lines.ToArray());
        }

    }
}
