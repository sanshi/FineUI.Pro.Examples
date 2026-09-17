using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class tablestyle_layout_info_border : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 启用大字体模式
                if (PageManager1.EnableLargeMode ||
                    PageManager1.DisplayMode == DisplayMode.Large ||
                    PageManager1.DisplayMode == DisplayMode.LargeSpace)
                {
                    Window1.Width = (Unit)1000;
                    Form1.LabelWidth = (Unit)120;
                }
            }
        }

    }
}