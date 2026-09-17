using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class twintriggerbox : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        // 点击 TwinTriggerBox 的搜索按钮
        protected void ttbxMyBox2_Trigger2Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(ttbxMyBox2.Text))
            {
                // 执行搜索动作
                ShowNotify(String.Format("在关键词“{0}”中搜索", ttbxMyBox2.Text));

                ttbxMyBox2.ShowTrigger1 = true;
            }
            else
            {
                ShowNotify("请输入你要搜索的关键词！");
            }
        }

        // 点击 TwinTriggerBox 的取消按钮
        protected void ttbxMyBox2_Trigger1Click(object sender, EventArgs e)
        {
            // 执行清空动作
            ShowNotify("取消搜索！");

            ttbxMyBox2.Text = "";
            ttbxMyBox2.ShowTrigger1 = false;
        }

       

    }
}
