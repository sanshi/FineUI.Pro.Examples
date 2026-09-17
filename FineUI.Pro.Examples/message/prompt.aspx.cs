using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.message
{
    public partial class prompt : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHello_Click(object sender, EventArgs e)
        {
            Prompt prompt = new Prompt();
            prompt.Message = tbxMessage.Text;
            prompt.Title = tbxTitle.Text;
            prompt.MessageBoxIcon = (MessageBoxIcon)Enum.Parse(typeof(MessageBoxIcon), rblMessageBoxIcon.SelectedValue, true);
            prompt.Target = (Target)Enum.Parse(typeof(Target), rblTarget.SelectedValue, true);

            if (cbxIsMultiLine.Checked)
            {
                // 多行输入框
                prompt.MultiLine = true;

                if (!String.IsNullOrEmpty(nbMultiLineHeight.Text))
                {
                    prompt.MultiLineHeight = Convert.ToInt32(nbMultiLineHeight.Text);
                }
            }
            else
            {
                // 单行输入框，判断是否密码输入框
                if (cbxIsPassword.Checked)
                {
                    prompt.TextMode = TextMode.Password;
                }
            }

            prompt.DefaultValue = tbxDefaultValue.Text;

            if (!String.IsNullOrEmpty(nbWidth.Text))
            {
                prompt.Width = Convert.ToInt32(nbWidth.Text);
            }

            if (!String.IsNullOrEmpty(nbMinWidth.Text))
            {
                prompt.MinWidth = Convert.ToInt32(nbMinWidth.Text);
            }

            if (!String.IsNullOrEmpty(nbMaxWidth.Text))
            {
                prompt.MaxWidth = Convert.ToInt32(nbMaxWidth.Text);
            }

            if (!String.IsNullOrEmpty(tbxID.Text))
            {
                prompt.ID = tbxID.Text;
            }

            if (cbxRequired.Checked)
            {
                prompt.Required = true;
            }

            if (!cbxEnableClose.Checked)
            {
                prompt.EnableClose = false;
            }

            prompt.OkScript = "promptOKCallback(arguments[0]);";

            prompt.Show();

        }

        protected void cbxIsMultiLine_CheckedChanged(object sender, CheckedEventArgs e)
        {
            nbMultiLineHeight.Hidden = !e.Checked;
            cbxIsPassword.Hidden = e.Checked;
        }




    }
}
