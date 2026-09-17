using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class tablestyle_form_compare : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DatePicker1.SelectedDate = DateTime.Now;

                // 启用大字体模式
                if (PageManager1.EnableLargeMode ||
                    PageManager1.DisplayMode == DisplayMode.Large ||
                    PageManager1.DisplayMode == DisplayMode.LargeSpace)
                {
                    SimpleForm1.Width = (Unit)700;
                    SimpleForm1.LabelWidth = (Unit)260;
                }
            }
        }
    }
}
