using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class triggerbox : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // 关闭弹出窗口
        protected void btnCloseWindow_Click(object sender, EventArgs e)
        {
            Window1.Hidden = true;

            tbxMyBox1.Text = "弹出窗口被关闭了";
        }

    }
}
