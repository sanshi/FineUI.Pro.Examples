using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.gridtree
{
    public partial class gridtree_expandrows : PageBase
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
            DataTable table = DataSourceUtil.GetTreeDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }

        #endregion

        #region Events

        #endregion

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            if (e.RowID == "50" || e.RowID == "60")
            {
                e.TreeNodeExpanded = true;
            }
        }

    }
}
