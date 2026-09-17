using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace FineUI.Pro.Examples.form
{
    public partial class checkboxlist_at_least_one : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Page_CustomEvent(object sender, CustomEventArgs e)
        {
            if (e.EventName == "CheckBoxList1Change")
            {
                if (CheckBoxList1.SelectedValueArray.Length > 0)
                {
                    ShowNotify(String.Format("列表一的选中项：{0}", String.Join(", ", CheckBoxList1.SelectedValueArray)));
                }
                else
                {
                    ShowNotify("列表一没有选中项！");
                }
            }
        }


        

    }
}
