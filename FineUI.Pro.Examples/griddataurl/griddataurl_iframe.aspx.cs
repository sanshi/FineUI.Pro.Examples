using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.griddataurl
{
    public partial class griddataurl_iframe : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        

        #region Events


        protected void Window1_Close(object sender, WindowCloseEventArgs e)
        {
            ShowNotify("窗体关闭了");
        }

        
        #endregion

    }
}
