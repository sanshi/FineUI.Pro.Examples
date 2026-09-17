using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.tabstrip
{
    public partial class tabstrip_closeondblclick : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void btnShowInServer_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Tab3.GetShowReference());
        }

        protected void btnShowActiveInServer_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Tab3.GetShowReference() + Tab3.GetActivateReference());
        }

        protected void btnHideInServer_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Tab3.GetHideReference());
        }
    }
}
