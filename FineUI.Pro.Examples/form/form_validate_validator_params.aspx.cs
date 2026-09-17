using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class form_validate_validator_params : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Attributes["data-maxlength"] = 3;
                TextBox2.Attributes["data-maxlength"] = 6;
            }
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Alert.Show("表单验证通过！");
        }


    }
}
