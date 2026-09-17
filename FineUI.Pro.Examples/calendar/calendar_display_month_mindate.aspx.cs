using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.calendar
{
    public partial class calendar_display_month_mindate : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Text = DateTime.Now.ToString(Calendar1.DateFormatString);

                Calendar1.MinDate = DateTime.Now.AddMonths(-5);
                Calendar1.MaxDate = DateTime.Now.AddMonths(5);

                Button1.Text = String.Format("选中{0}", DateTime.Now.AddMonths(2).ToString(Calendar1.DateFormatString));
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
            Calendar1.Text = DateTime.Now.AddMonths(2).ToString(Calendar1.DateFormatString);

            UpdateResult();
        }
    }
}
