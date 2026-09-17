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
    public partial class griddataurl_rowdoubleclick_custompostback : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Grid1_RowDblClick")
            {
                JObject param = e.EventArgumentsAsJObject;
                ShowNotify(String.Format("你双击了第 {0} 行，行ID：{1}，姓名：{2}",
                    param.Value<int>("rowIndex") + 1, param.Value<string>("rowId"), param.Value<string>("rowText")));
            }
        }

        

        #region Events


        #endregion

    }
}
