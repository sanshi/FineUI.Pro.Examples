using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.button
{
    public partial class button_client_disable : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnChangeEnable_Click(object sender, EventArgs e)
        {
            Alert.Show("你点击了按钮！");
        }



    }
}
