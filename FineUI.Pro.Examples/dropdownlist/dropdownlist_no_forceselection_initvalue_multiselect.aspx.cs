using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Pro.Examples.dropdownlist
{
    public partial class dropdownlist_no_forceselection_initvalue_multiselect : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 设置下拉列表的初始值为自定义文本
                DropDownList1.Text = "初始自定义值";
            }
        }

        protected void btnSelectItem6_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValueArray = new string[] { "Value4", "Value6" };
        }

        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValueArray != null && DropDownList1.SelectedValueArray.Length > 0)
            {
                labResult.Text = String.Format("选中项文本：{0}<br/>选中项值：{1}", DropDownList1.Text, String.Join(", ", DropDownList1.SelectedValueArray));
            }
            else
            {
                labResult.Text = String.Format("用户输入值：{0}", DropDownList1.Text);
            }
        }

        protected void btnSetText_Click(object sender, EventArgs e)
        {
            DropDownList1.Text = "用户输入值";
        }

    }
}
