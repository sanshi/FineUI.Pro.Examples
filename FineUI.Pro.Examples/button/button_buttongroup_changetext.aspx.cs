using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.button
{
    public partial class button_buttongroup_changetext : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangeButtonText_Click(object sender, EventArgs e)
        {
            Button4.Text = Button4.Text.Length == 3 ? "按钮四（" + DateTime.Now.ToString() + "）" : "按钮四";
        }

        protected void btnShowHideButton_Click(object sender, EventArgs e)
        {
            Button4.Hidden = !Button4.Hidden;
        }

        protected void btnChangeButtonText2_Click(object sender, EventArgs e)
        {
            Button8.Text = Button8.Text.Length == 3 ? "按钮八（" + DateTime.Now.ToString() + "）" : "按钮八";
        }

        protected void btnShowHideButton2_Click(object sender, EventArgs e)
        {
            Button8.Hidden = !Button8.Hidden;
        }

    }
}
