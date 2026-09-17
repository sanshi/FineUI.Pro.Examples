using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.dropdownlist
{
    public partial class multiselect_enableedit_no_forceselection : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSelectItem6_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "Value6";
        }

        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValueArray != null && DropDownList1.SelectedValueArray.Length > 0)
            {
                labResult.Text = String.Format("选中项文本：{0}<br/>选中项值：{1}", DropDownList1.Text, String.Join(", ", DropDownList1.SelectedValueArray));
            }
            else
            {
                labResult.Text = String.Format("用户输入值：{0}", String.IsNullOrEmpty(DropDownList1.Text) ? "空" : DropDownList1.Text);
            }
        }



    }
}
