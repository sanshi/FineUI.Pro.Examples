using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.griddataurl
{
    public partial class griddataurl_changedataurl : PageBase
    {
        protected void btnReload_Click(object sender, EventArgs e)
        {
            // 不传地址，沿用客户端当前地址；该调用只发起异步请求。
            string gridId = Newtonsoft.Json.JsonConvert.SerializeObject(Grid1.ClientID);
            PageContext.RegisterStartupScript("F(" + gridId + ").loadDataUrl();");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        #region Events


        protected void btnRebind_Click(object sender, EventArgs e)
        {
            if (Grid1.DataUrl.EndsWith("griddataurl.ashx"))
            {
                Grid1.DataUrl = "~/griddataurl/griddataurl2.ashx";
            }
            else
            {
                Grid1.DataUrl = "~/griddataurl/griddataurl.ashx";
            }

        }

        #endregion

        

    }
}
