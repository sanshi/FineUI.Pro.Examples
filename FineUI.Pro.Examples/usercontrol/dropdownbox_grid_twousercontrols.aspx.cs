using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.usercontrol
{
    public partial class dropdownbox_grid_twousercontrols : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }


        #region Events

        protected void btnGetSelection_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            if (!String.IsNullOrEmpty(DropDownBox1.Text))
            {
                sb.AppendFormat("用户甲：{0}（值：{1}）", DropDownBox1.Text, String.Join(", ",  DropDownBox1.Values));
            }
            else
            {
                sb.Append("用户甲为空");
            }

            if (!String.IsNullOrEmpty(DropDownBox2.Text))
            {
                sb.Append("<br/>");
                sb.AppendFormat("用户乙：{0}（值：{1}）", DropDownBox2.Text, String.Join(", ",  DropDownBox2.Values));
            }
            else
            {
                sb.Append("<br/>");
                sb.Append("用户乙为空");
            }

            labResult.Text = sb.ToString();
        }


        #endregion






    }
}
