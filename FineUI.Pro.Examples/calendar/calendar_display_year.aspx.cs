using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.calendar
{
    public partial class calendar_display_year : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Text = DateTime.Now.ToString(Calendar1.DateFormatString);

                Button1.Text = String.Format("选中{0}", DateTime.Now.AddYears(2).Year);
            }
        }

        private void UpdateResult()
        {
            labResult1.Text = String.Format("选择的年份：{0}", Calendar1.Text);
        }

        protected void Calendar1_DateSelect(object sender, EventArgs e)
        {
            UpdateResult();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calendar1.Text = DateTime.Now.AddYears(2).Year.ToString();

            UpdateResult();
        }
    }
}
