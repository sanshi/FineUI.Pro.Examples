using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace FineUI.Pro.Examples.dropdownlist
{
    public partial class dropdownlist_autopostback_enableedit_noforceselection : PageBase
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

        private void CheckSelection()
        {
            if (!String.IsNullOrEmpty(DropDownList1.SelectedValue))
            {
                ShowNotify(String.Format("选中项：{0}（值：{1}）", DropDownList1.Text, DropDownList1.SelectedValue));
            }
            else
            {
                ShowNotify(String.Format("用户输入值：{0}", DropDownList1.Text));
            }
        }

        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            CheckSelection();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckSelection();
        }

       

    }
}
