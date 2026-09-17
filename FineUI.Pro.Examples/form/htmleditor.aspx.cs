using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class htmleditor : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HtmlEditor1.Text = "FineUI.Pro<br>.NET 企业级全栈 UI 框架。<br><br>FineUI的使命<br>创建 No JavaScript，No CSS，No UpdatePanel，No ViewState 的网站应用程序。<br><br>支持的浏览器<br>IE 8.0+、Chrome、Firefox、Opera、Safari<br><br>授权协议<br>商业授权<br><br>相关链接<br>论坛：<a href=\"http://fineui.com/bbs/\">http://fineui.com/bbs/</a><br>示例：<a href=\"https://fineui.com/pro/demo/\">https://fineui.com/pro/demo/</a><br><br>";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextArea1.Text = HtmlEditor1.Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            HtmlEditor1.Text = TextArea1.Text;
        }
    }
}
