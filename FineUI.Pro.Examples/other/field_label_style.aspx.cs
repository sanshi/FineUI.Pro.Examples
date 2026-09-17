using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.other
{
    public partial class field_label_style : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSwitchClass_Click(object sender, EventArgs e)
        {
            if (tbxUserName.CssClass != "red")
            {
                tbxUserName.CssClass = "red";
                tbxPassword.CssClass = "red";
            }
            else
            {
                tbxUserName.CssClass = "blue";
                tbxPassword.CssClass = "blue";
            }

        }

    }
}