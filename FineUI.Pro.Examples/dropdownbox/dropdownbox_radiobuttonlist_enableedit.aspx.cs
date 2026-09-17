using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Pro.Examples.dropdownbox
{
    public partial class dropdownbox_radiobuttonlist_enableedit : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }


        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(DropDownBox1.Value))
            {
                labResult.Text = String.Format("下拉框文本：{0}（值：{1}）", DropDownBox1.Text, DropDownBox1.Value);
            }
            else
            {
                labResult.Text = String.Format("用户输入值：{0}", DropDownBox1.Text);
            }
        }

       

    }
}
