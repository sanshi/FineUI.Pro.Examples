using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.datepicker
{
    public partial class datepicker_dayrange_time_showsecond : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DatePicker1.RangeStartDate = DateTime.Parse("2014-07-30 14:30");
                DatePicker1.RangeEndDate = DateTime.Parse("2014-08-08 16:30");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            labResult.Text = String.Format("选择的日期：{0}", DatePicker1.Text);
        }
    }
}
