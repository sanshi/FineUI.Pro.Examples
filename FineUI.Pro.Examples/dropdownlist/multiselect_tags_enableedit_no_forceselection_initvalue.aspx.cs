using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.dropdownlist
{
    public partial class multiselect_tags_enableedit_no_forceselection_initvalue : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Text = "可选项1, 可选项4, 初始自定义值1";
                DropDownList1.SelectedValueArray = new string[] { "Value1", "Value4", "__USERINPUT_value1" };
            }
        }

        protected void btnSelectItem6_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "Value6";
        }

        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(DropDownList1.Text))
            {
                labResult.Text = String.Format("选中项文本：{0}<br/>选中项值：{1}", DropDownList1.Text, String.Join(", ", DropDownList1.SelectedValueArray));
            }
            else
            {
                labResult.Text = "无选中项";
            }
        }



    }
}
