using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class tablestyle_approval : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        protected void rbt_Approval_SelectedIndexChanged(object sender, EventArgs e)
        {
            fromSelectVehicle.Hidden = rbt_Approval.SelectedValue != "1";
        }

    }
}
