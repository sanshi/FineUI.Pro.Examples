using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.block
{
    public partial class dashboard : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable table = DataSourceUtil.GetDataTable();

                Grid1.DataSource = table;
                Grid1.DataBind();
            }
        }


    }
}
