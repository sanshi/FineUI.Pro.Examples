using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class checkbox_switch : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckBox5.SwitchOnTextRawHtml = new RawHtml("<i class=\"f-icon f-iconfont f-iconfont-check\"></i>");
                CheckBox5.SwitchOffTextRawHtml = new RawHtml("<i class=\"f-icon f-iconfont f-iconfont-close\"></i>");
            }
        }

        

        protected void btnSelectCheckBox_Click(object sender, EventArgs e)
        {
            CheckBox1.Checked = !CheckBox1.Checked;
        }

        protected void btnDisableCheckBox_Click(object sender, EventArgs e)
        {
            CheckBox1.Enabled = !CheckBox1.Enabled;
        }
		
		protected void CheckBox2_CheckedChanged(object sender, CheckedEventArgs e)
        {
            ShowNotify("复选框的状态：" + (CheckBox2.Checked ? "选中" : "未选中"));
        }

    }
}