using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class form_columnseparatorwidth : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btnSubmitForm2_Click(object sender, EventArgs e)
        {
            ShowNotify("表单验证并提交成功！");
        }



        
    }
}
