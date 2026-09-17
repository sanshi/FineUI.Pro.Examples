using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class form_validate_alert : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (tbxUserName.Text == "admin")
            {
                string errorMsg = String.Format("{0} 是保留字，请另外选择！", tbxUserName.Text);

                tbxUserName.MarkInvalid(errorMsg);

                // 延迟 200ms 执行输入框获取焦点操作，防止按Enter键关闭弹出框的同时清空文本输入框
                Alert.Show(errorMsg, String.Empty, tbxUserName.GetFocusReference(true, 200));
            }
        }


    }
}
