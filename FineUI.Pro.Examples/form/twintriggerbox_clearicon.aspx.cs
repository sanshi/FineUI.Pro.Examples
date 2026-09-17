using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class twintriggerbox_clearicon : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "TwinTriggerBox1Change")
            {
                if (!String.IsNullOrEmpty(TwinTriggerBox1.Text))
                {
                    TwinTriggerBox1_Trigger2Click(null, null);
                }
                else
                {
                    TwinTriggerBox1_Trigger1Click(null, null);
                }
            }
        }

        protected void TwinTriggerBox1_Trigger2Click(object sender, EventArgs e)
        {
            // 点击 TwinTriggerBox 的搜索按钮
            if (!String.IsNullOrEmpty(TwinTriggerBox1.Text))
            {
                // 执行搜索动作
                ShowNotify(String.Format("在关键词“{0}”中搜索", TwinTriggerBox1.Text));

                UpdateClientJSParameter(TwinTriggerBox1.Text);
            }
            else
            {
                ShowNotify("请输入你要搜索的关键词！");
            }
        }


        protected void TwinTriggerBox1_Trigger1Click(object sender, EventArgs e)
        {
            // 点击 TwinTriggerBox 的取消按钮
            ShowNotify("取消搜索！");

            UpdateClientJSParameter("");
        }
        // 更新客户端变量
        private void UpdateClientJSParameter(string text)
        {
            PageContext.RegisterStartupScript(String.Format("updateLastTriggerBoxValue({0});", JsHelper.Enquote(text)));
        }

    }
}
