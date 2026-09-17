using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.aspnet
{
    public partial class ueditor_window : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HtmlEditor1.Text = "<p>FineUI.Pro<br>.NET 企业级全栈 UI 框架。<br><br>FineUI的使命<br>创建 No JavaScript，No CSS，No UpdatePanel，No ViewState 的网站应用程序。<br><br>支持的浏览器<br>Chrome、Firefox、Safari、Edge<br><br>相关链接<br>首页：http://fineui.com/pro/<br>示例：https://fineui.com/pro/demo/<br>更新：http://fineui.com/versions/</p>";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(HtmlEditor1.Text))
            {
                ShowNotify("编辑器内容为空！");
            }
            else
            {
                ShowNotify(HtmlEditor1.Text);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string content = "<p><strong>FineUI.Pro</strong> - .NET 企业级全栈 UI 框架。</p>";
            HtmlEditor1.Text = content;
        }





    }
}
