using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class numberbox_trimend : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            labResult.Text = "小数一：" + NumberBox1.Text + " 小数二：" + NumberBox2.Text;
        }

    }
}
