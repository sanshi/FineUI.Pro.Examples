using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class numberbox_textchange : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ShowNotify("数字输入框的值：" + NumberBox3.Text);
        }

        protected void NumberBox3_TextChanged(object sender, EventArgs e)
        {
            ShowNotify("数字输入框的值：" + NumberBox3.Text);
        }

    }
}
