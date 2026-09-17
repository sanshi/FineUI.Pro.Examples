using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.calendar
{
    public partial class calendar_monthrange_confirmbutton : PageBase
    {
        private DateTime startDate = DateTime.Now.AddMonths(2);
        private DateTime endDate = DateTime.Now.AddMonths(10);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.RangeStartDate = DateTime.Now.AddMonths(0);
                Calendar1.RangeEndDate = DateTime.Now.AddMonths(5);

                Calendar1.MinDate = DateTime.Now.AddMonths(-5);
                Calendar1.MaxDate = DateTime.Now.AddMonths(15);

                Button1.Text = String.Format("选中范围：{0} - {1}", startDate.ToString(Calendar1.DateFormatString), endDate.ToString(Calendar1.DateFormatString));
            }
        }

        private void UpdateResult()
        {
            labResult1.Text = String.Format("月份范围：{0}", Calendar1.Text);
        }

        protected void Calendar1_DateSelect(object sender, EventArgs e)
        {
            UpdateResult();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.RangeStartDate = startDate;
            Calendar1.RangeEndDate = endDate;

            UpdateResult();
        }
    }
}
