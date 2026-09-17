using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.calendar
{
    public partial class calendar_yearrange : PageBase
    {
        private int startYear = DateTime.Now.AddYears(2).Year;
        private int endYear = DateTime.Now.AddYears(10).Year;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.RangeStartDate = DateTime.Now.AddYears(0);
                Calendar1.RangeEndDate = DateTime.Now.AddYears(5);

                Calendar1.MinDate = DateTime.Now.AddYears(-5);
                Calendar1.MaxDate = DateTime.Now.AddYears(15);

                Button1.Text = String.Format("选中范围：{0} - {1}", startYear, endYear);
            }
        }

        private void UpdateResult()
        {
            labResult1.Text = String.Format("年份范围：{0}", Calendar1.Text);
        }

        protected void Calendar1_DateSelect(object sender, EventArgs e)
        {
            UpdateResult();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.Text = String.Format("{0} - {1}", startYear, endYear);

            UpdateResult();
        }
    }
}
