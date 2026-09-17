using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.gridbigdata
{
    public partial class bigdata_dataurl_10000_paging : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }


        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            labResult.Text = "选中的行ID：" + String.Join(", ", Grid1.SelectedRowIDArray);
        }

        #endregion

    }
}
