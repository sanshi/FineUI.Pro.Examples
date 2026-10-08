using System;

namespace FineUI.Pro.Examples.toolbar
{
    public partial class toolbar_bodypadding : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 首次渲染前也可通过后台属性增加留白；这里让左对齐工具栏四周各留出 12px。
                ToolbarLeft.BodyPadding = "12";
            }
        }

    }
}
