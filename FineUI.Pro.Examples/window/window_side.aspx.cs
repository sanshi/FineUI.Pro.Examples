using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.window
{
    public partial class window_side : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            Alert.Show("Window1_Close");
        }



    }
}
