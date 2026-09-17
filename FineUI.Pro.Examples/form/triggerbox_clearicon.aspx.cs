using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class triggerbox_clearicon : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Alert.Show("文本框的输入值：" + tbxMyBox1.Text);
        }

    }
}
