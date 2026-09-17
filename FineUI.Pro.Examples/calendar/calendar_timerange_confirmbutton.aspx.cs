using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.calendar
{
    public partial class calendar_timerange_confirmbutton : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Text = "14:30:00 - 16:30:00";

                Button1.Text = String.Format("选中范围：{0} - {1}", "08:50:00", "11:50:00");
            }
        }

        private void UpdateResult()
        {
            labResult1.Text = String.Format("时间范围：{0}", Calendar1.Text);
        }

        protected void Calendar1_DateSelect(object sender, EventArgs e)
        {
            UpdateResult();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.Text = "08:50:00 - 11:50:00";

            UpdateResult();
        }
    }
}
