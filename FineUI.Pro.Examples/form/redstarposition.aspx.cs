using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.form
{
    public partial class redstarposition : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ShowLoginResult(tbxUserName.Text, tbxPassword.Text);
        }

        protected void btnLoginForm2_Click(object sender, EventArgs e)
        {
            ShowLoginResult(TextBox1.Text, TextBox2.Text);
        }

        protected void btnLoginForm3_Click(object sender, EventArgs e)
        {
            ShowLoginResult(TextBox3.Text, TextBox4.Text);
        }

        // 每张表单使用自己的输入，提交第二、第三张表单时也能得到对应的登录结果。
        private void ShowLoginResult(string userName, string password)
        {
            if (userName == "admin" && password == "admin")
            {
                ShowNotify("成功登录！", MessageBoxIcon.Success);
            }
            else
            {
                ShowNotify("用户名或密码错误！", MessageBoxIcon.Error);
            }
        }

    }
}
