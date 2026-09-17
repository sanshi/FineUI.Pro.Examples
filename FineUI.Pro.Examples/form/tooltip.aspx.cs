using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class tooltip : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTooltip_Click(object sender, EventArgs e)
        {
             Image2.ToolTipTitle="修改后的标题";
             Image2.ToolTip = "修改后的提示框正文...";
        }


    }
}
