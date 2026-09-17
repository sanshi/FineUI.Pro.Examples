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
    public partial class menu_icon : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (MenuHyperLink1.Icon == Icon.Accept)
            {
                MenuHyperLink1.Icon = Icon.None;
            }
            else
            {
                MenuHyperLink1.Icon = Icon.Accept;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (MenuHyperLink2.Icon == Icon.Accept)
            {
                MenuHyperLink2.Icon = Icon.Application;
            }
            else
            {
                MenuHyperLink2.Icon = Icon.Accept;
            }
        }


    }
}
