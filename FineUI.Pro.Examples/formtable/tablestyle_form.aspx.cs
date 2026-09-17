using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.form
{
    public partial class tablestyle_form : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 启用大字体模式
                if (PageManager1.EnableLargeMode || 
                    PageManager1.DisplayMode == DisplayMode.Large ||
                    PageManager1.DisplayMode == DisplayMode.LargeSpace)
                {
                    Form1.LabelWidth = (Unit)120;
                    Form2.LabelWidth = (Unit)120;
                }
            }
        }

        protected void btnSubmitForm1_Click(object sender, EventArgs e)
        {
            ShowNotify("表单 1 验证并提交成功！");
        }

        protected void btnSubmitForm2_Click(object sender, EventArgs e)
        {
            ShowNotify("表单 2 验证并提交成功！");
        }

        protected void btnSubmitAll_Click(object sender, EventArgs e)
        {
            ShowNotify("表单 1 和表单 2 验证并提交成功！");
        }


    }
}
