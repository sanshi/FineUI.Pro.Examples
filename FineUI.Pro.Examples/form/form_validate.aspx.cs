using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class form_validate : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (tbxUserName.Text == "admin")
            {
                tbxUserName.MarkInvalid(String.Format("{0} 是保留字，请另外选择！", tbxUserName.Text));

                //// 用户名验证失败，则重新聚焦到用户名
                //PageContext.RegisterStartupScript(tbxUserName.GetFocusReference(true, 200));
            }
        }


    }
}
