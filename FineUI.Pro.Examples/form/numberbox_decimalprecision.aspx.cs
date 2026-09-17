using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class numberbox_decimalprecision : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NumberBox1.Text = "0.356";
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ShowNotify("数字输入框的值：" + NumberBox1.Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NumberBox1.DecimalPrecision = 1;
            NumberBox1.Increment = 0.1;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            NumberBox1.DecimalPrecision = 2;
            NumberBox1.Increment = 0.01;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            NumberBox1.DecimalPrecision = 3;
            NumberBox1.Increment = 0.001;
        }

    }
}
