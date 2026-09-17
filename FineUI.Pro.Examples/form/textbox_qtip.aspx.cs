using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class textbox_qtip : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 鼠标移动到标签和输入框，都会有提示信息
                tbxUserName.Attributes["data-qtitle"] = "用户名";
                tbxUserName.Attributes["data-qtip"] = "通过Attributes属性设置的提示信息，鼠标移动到标签和输入框都会提示";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            labResult.Text = "用户名：" + tbxUserName.Text + " 密码：" + tbxPassword.Text;
        }
    }
}
