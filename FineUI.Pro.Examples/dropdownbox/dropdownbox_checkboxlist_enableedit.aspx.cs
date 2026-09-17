using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Pro.Examples.dropdownbox
{
    public partial class dropdownbox_checkboxlist_enableedit : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }


        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            if (DropDownBox1.Values != null && DropDownBox1.Values.Length > 0)
            {
                labResult.Text = String.Format("下拉框文本：{0}（值：{1}）", DropDownBox1.Text, String.Join(", ",  DropDownBox1.Values));
            }
            else
            {
                labResult.Text = String.Format("用户输入值：{0}", DropDownBox1.Text);
            }
        }


        protected void btnSelectItem6_Click(object sender, EventArgs e)
        {
            // 后台更新下拉框的值，需要同时设置Text和Value
            DropDownBox1.Texts = new string[] { "PHP", "Basic" };
            DropDownBox1.Values = new string[] { "php", "basic" };
            
        }

    }
}
