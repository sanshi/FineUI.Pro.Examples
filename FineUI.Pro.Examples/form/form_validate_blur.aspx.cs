using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class form_validate_blur : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (ValidateForm())
            {
                Alert.ShowInTop("表单提交成功！");
            }
        }

        protected void tbxUserName_Blur(object sender, EventArgs e)
        {
            if (ValidateForm())
            {
                // 用户名失去焦点，并且用户名有效，则聚焦到下一个控件
                PageContext.RegisterStartupScript(tbxPassword.GetFocusReference(true));
            }
        }


        private bool ValidateForm()
        {
            if (tbxUserName.Text == "admin")
            {
                tbxUserName.MarkInvalid(String.Format("{0} 是保留字，请另外选择！", tbxUserName.Text));
                
                return false;
            }
            else
            {
                tbxUserName.ClearInvalid();

                return true;
            }
        }

    }
}
