using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_newtab_hideupdate_window : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();

                string paramName = Request.QueryString["name"];
                if (!String.IsNullOrEmpty(paramName))
                {
                    labUserName.Text = paramName;
                }
            }
        }

        private void LoadData()
        {
        }

        protected void btnCloseRefresh_Click(object sender, EventArgs e)
        {
            FineUI.Pro.Alert.Show("保存成功！", String.Empty, Alert.DefaultMessageBoxIcon,
                "parent.activeTabAndUpdate('" + Request.QueryString["parenttabid"] + "', '" + DatePicker1.Text + "');");
        }
    }
}
