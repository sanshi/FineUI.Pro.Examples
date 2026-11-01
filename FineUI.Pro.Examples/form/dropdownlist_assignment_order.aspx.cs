using System;

namespace FineUI.Pro.Examples.form
{
    public partial class dropdownlist_assignment_order : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList2.SelectedValue = "a";
            }
        }

        protected void btnValueThenText_Click(object sender, EventArgs e)
        {
            DropDownList2.ClearSelection();
            DropDownList2.SelectedValue = "a";
            DropDownList2.Text = "自定义输入";
            labResult.Text = "赋值后选中值：" + (DropDownList2.SelectedValue ?? "空");
        }

        protected void btnTextThenValue_Click(object sender, EventArgs e)
        {
            DropDownList2.ClearSelection();
            DropDownList2.Text = "自定义输入";
            DropDownList2.SelectedValue = "a";
            labResult.Text = "赋值后选中值：" + (DropDownList2.SelectedValue ?? "空");
        }

        protected void btnReadDropDownList_Click(object sender, EventArgs e)
        {
            labResult.Text = "选中值：" + (DropDownList2.SelectedValue ?? "空") + "；文字：" + DropDownList2.Text;
        }
    }
}
