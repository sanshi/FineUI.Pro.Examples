using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Pro.Examples.dropdownlist
{
    public partial class dropdownlist_emptytext_enableedit : PageBase
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
            if (!String.IsNullOrEmpty(DropDownList1.Text))
            {
                labResult.Text = String.Format("选中项：{0}（值：{1}）", DropDownList1.Text, DropDownList1.SelectedValue);
            }
            else
            {
                labResult.Text = "无选中项";
            }
        }

    }
}
