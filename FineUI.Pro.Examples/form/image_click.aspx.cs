using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class image_click : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Image1.ImageUrl.EndsWith("cake.png"))
            {
                Image1.ImageUrl = "~/res/icon/world.png";
            }
            else
            {
                Image1.ImageUrl = "~/res/icon/cake.png";
            }
        }

    }
}
