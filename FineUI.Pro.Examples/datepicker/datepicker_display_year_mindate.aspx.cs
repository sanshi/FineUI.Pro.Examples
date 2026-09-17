using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.datepicker
{
    public partial class datepicker_display_year_mindate : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DatePicker1.Text = DateTime.Now.ToString(DatePicker1.DateFormatString);

                DatePicker1.MinDate = DateTime.Now.AddYears(-5);
                DatePicker1.MaxDate = DateTime.Now.AddYears(5);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            labResult.Text = String.Format("开始年份：{0}  结束年份：{1}",
                DatePicker1.Text,
                DatePicker2.Text);
        }
    }
}
