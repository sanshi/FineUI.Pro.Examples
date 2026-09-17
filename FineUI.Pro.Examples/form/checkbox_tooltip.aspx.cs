using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class checkbox_tooltip : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckBox1.Attributes["data-qtip"] = "复选框 1 的提示信息";
                CheckBox2.Attributes["data-qtip"] = "复选框 2 的提示信息";
            }
        }

    }
}