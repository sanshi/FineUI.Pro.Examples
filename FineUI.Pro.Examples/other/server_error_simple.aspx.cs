using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.other
{
    public partial class server_error_simple : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button5_Click(object sender, EventArgs e)
        {
            throw new Exception("服务器异常错误！");
        }

      
    }
}