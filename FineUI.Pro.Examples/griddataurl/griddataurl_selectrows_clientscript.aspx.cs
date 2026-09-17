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
    public partial class griddataurl_selectrows_clientscript : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 网址数据源模式下也应按稳定行ID设置选中项。
                Grid1.SelectedRowIDArray = new string[] { "105", "110" };
            }
        }


        #region Events


        #endregion

    }
}
