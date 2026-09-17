using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.calendar
{
    public partial class calendar_time : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.SelectedDate = DateTime.Now.AddDays(10);

                DateTime newDate= DateTime.Now.AddDays(2);
                newDate = new DateTime(newDate.Year, newDate.Month, newDate.Day, 0, 0, 0);
                Button1.Text = String.Format("选中{0}", newDate.ToString(Calendar1.DateFormatString));
            }
        }

        private void UpdateResult()
        {
            labResult1.Text = String.Format("选择的日期：{0}", Calendar1.SelectedDate.Value.ToString(Calendar1.DateFormatString));
        }

        protected void Calendar1_DateSelect(object sender, EventArgs e)
        {
            UpdateResult();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime newDate = DateTime.Now.AddDays(2);
            newDate = new DateTime(newDate.Year, newDate.Month, newDate.Day, 0, 0, 0);
            Calendar1.SelectedDate = newDate;

            UpdateResult();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            UpdateResult();
        }

    }
}
