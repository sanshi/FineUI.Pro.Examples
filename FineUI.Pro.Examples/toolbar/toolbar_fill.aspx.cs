using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Xml;
using System.IO;
using System.Reflection;

namespace FineUI.Pro.Examples.toolbar
{
    public partial class toolbar_fill : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnHideFill1_Click(object sender, EventArgs e)
        {
            if (Button1.Hidden)
            {
                Button1.Hidden = false;
                ToolbarFill1.Hidden = false;
            }
            else
            {
                Button1.Hidden = true;
                ToolbarFill1.Hidden = true;
            }
        }

        protected void btnHideFill2_Click(object sender, EventArgs e)
        {
            if (ToolbarFill5.Hidden)
            {
                ToolbarFill5.Hidden = false;
            }
            else
            {
                ToolbarFill5.Hidden = true;
            }
        }
    }
}
