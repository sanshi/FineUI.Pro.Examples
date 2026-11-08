using System;

namespace FineUI.Pro.Examples.form
{
    public partial class field_helper_text : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            tbxEmail.HelperText = "请填写部门公共邮箱，便于同事接收后续通知。";
        }

        protected void btnClearHelper_Click(object sender, EventArgs e)
        {
            tbxEmail.HelperText = null;
        }

        protected void btnRead_Click(object sender, EventArgs e)
        {
            labResult.Text = tbxEmail.HelperText;
        }
    }
}
