using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class checkbox : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogCheckboxStatus();
            }
        }

        protected void CheckBox2_CheckedChanged(object sender, CheckedEventArgs e)
        {
            LogCheckboxStatus();
        }

        private void LogCheckboxStatus()
        {
            labResult.Text = "复选框的状态：" + (CheckBox2.Checked ? "选中" : "未选中");
        }

        protected void btnSelectCheckBox_Click(object sender, EventArgs e)
        {
            CheckBox1.Checked = !CheckBox1.Checked;
        }

        protected void btnDisableCheckBox_Click(object sender, EventArgs e)
        {
            CheckBox1.Enabled = !CheckBox1.Enabled;
        }

        protected void btnChangeText_Click(object sender, EventArgs e)
        {
            CheckBox1.Text = String.Format("复选框（{0}）", DateTime.Now.ToLongTimeString());
        }
    }
}