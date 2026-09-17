using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class numberbox_rate : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ShowNotify("表单验证成功");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var currentNum = Convert.ToInt32(NumberBox12.Text);

            currentNum++;
            if (currentNum > 5)
            {
                currentNum = 0;
            }

            NumberBox12.Text = currentNum.ToString();
        }

    }
}
