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
    public partial class griddataurl_rowbutton : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "Grid1_CustomEvent")
            {
                JObject param = e.EventArgumentsAsJObject;
                string eventType = param.Value<string>("eventType");
                string eventTypeText = String.Empty;
                if (eventType == "edit")
                {
                    eventTypeText = "编辑";
                }
                else if (eventType == "delete")
                {
                    eventTypeText = "删除";
                }

                ShowNotify(String.Format("你点击了第 {0} 行的 {3} 按钮，行ID：{1}，姓名：{2}",
                    param.Value<int>("rowIndex") + 1, param.Value<string>("rowId"),
                    param.Value<string>("rowText"), eventTypeText));
            }
        }

        

        #region Events

        

        #endregion

    }
}
