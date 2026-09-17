using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;

namespace FineUI.Pro.Examples.aspnet
{
    public partial class umeditor_tabstrip : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HtmlEditor1.Text = "<p>FineUI.Pro<br>.NET 企业级全栈 UI 框架。<br><br>FineUI的使命<br>创建 No JavaScript，No CSS，No UpdatePanel，No ViewState 的网站应用程序。<br><br>支持的浏览器<br>Chrome、Firefox、Safari、Edge<br><br>相关链接<br>首页：http://fineui.com/pro/<br>示例：https://fineui.com/pro/demo/<br>更新：http://fineui.com/versions/</p>";
                HtmlEditor2.Text = "<p>这是编辑器二的值</p>";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // 用户输入已用 HtmlEncode 转义；外层 <br/> 是可信 HTML，用 RawHtml 重载原样输出
            ShowNotify(new RawHtml("编辑器一：" + HttpUtility.HtmlEncode(HtmlEditor1.Text) + "<br/>" + "编辑器二：" + HttpUtility.HtmlEncode(HtmlEditor2.Text)));
        }




    }
}
