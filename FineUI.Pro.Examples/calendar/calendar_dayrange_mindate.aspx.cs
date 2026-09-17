using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.calendar
{
    public partial class calendar_dayrange_mindate : PageBase
    {
        private DateTime startDate = DateTime.Now.AddDays(2);
        private DateTime endDate = DateTime.Now.AddDays(20);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.MinDate = DateTime.Now;
                Calendar1.MaxDate = DateTime.Now.AddDays(30);

                Calendar1.RangeStartDate = DateTime.Now.AddDays(5);
                Calendar1.RangeEndDate = DateTime.Now.AddDays(10);

                Button1.Text = String.Format("选中范围：{0} - {1}", startDate.ToString(Calendar1.DateFormatString), endDate.ToString(Calendar1.DateFormatString));
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
            Calendar1.RangeStartDate = startDate;
            Calendar1.RangeEndDate = endDate;

            UpdateResult();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateResult();
        }
    }
}
