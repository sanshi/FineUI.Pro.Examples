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
    public partial class bigdata_10000_rowtip : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            Grid1.DataSource = BigDataUtil.GetBigData(10000);
            Grid1.DataBind();
        }

        #endregion

    }
}
