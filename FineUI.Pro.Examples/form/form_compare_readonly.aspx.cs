using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class form_compare_readonly : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void btnUpdateDatePicker_Click(object sender, EventArgs e)
        {
            DatePicker1.SelectedDate = DateTime.Now;
            DatePicker2.SelectedDate = DateTime.Now.AddDays(1);
        }
    }
}
