using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.calendar
{
    public partial class calendar_dayrange_time_confirmbutton : PageBase
    {
        private DateTime GetStartDate()
        {
            var date = DateTime.Now.AddDays(2);
            return new DateTime(date.Year, date.Month, date.Day, 8, 50, 0);
        }
        private DateTime GetEndDate()
        {
            var date = DateTime.Now.AddDays(20);
            return new DateTime(date.Year, date.Month, date.Day, 11, 50, 0);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.RangeStartDate = DateTime.Parse("2014-07-30 14:30:00");
                Calendar1.RangeEndDate = DateTime.Parse("2014-08-08 16:30:00");

                Button1.Text = String.Format("选中范围：{0} - {1}", GetStartDate().ToString(Calendar1.DateFormatString), GetEndDate().ToString(Calendar1.DateFormatString));
            }
        }

        private void UpdateResult()
        {
            labResult1.Text = String.Format("选择的日期：{0}", Calendar1.Text);
        }

        protected void Calendar1_DateSelect(object sender, EventArgs e)
        {
            UpdateResult();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.RangeStartDate = GetStartDate();
            Calendar1.RangeEndDate = GetEndDate();

            UpdateResult();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateResult();
        }

    }
}
