using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class form_attributes : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label2.Attributes["data-qtip"] = "通过Attributes属性设置的提示信息";

                // 设置图片的 usemap 属性
                imgChina.Attributes["usemap"] = "#ChinaMap";
            }

        }


        protected void btnChangeTip1_Click(object sender, EventArgs e)
        {
            Label1.ToolTip = "改变后的提示信息（ToolTip）";
        }


        protected void btnChangeTip2_Click(object sender, EventArgs e)
        {
            Label2.Attributes["data-qtip"] = "改变后的提示信息（Attributes）";
        }

    }
}
