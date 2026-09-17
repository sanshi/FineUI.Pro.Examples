using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.datepicker
{
    public partial class datepicker_display_time_confirmbutton : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DatePicker1.Text = "23:38:02";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            labResult.Text = String.Format("开始时间：{0}  结束时间：{1}",
                DatePicker1.Text,
                DatePicker2.Text);
        }
    }
}
