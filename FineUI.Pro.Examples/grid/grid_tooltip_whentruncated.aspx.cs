using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_tooltip_whentruncated : PageBase
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
            // 修改最后一行的数据
            DataTable table = DataSourceUtil.GetDataTable();
            DataRow lastRow = table.Rows[table.Rows.Count - 1];
            lastRow["Major"] = "<b>\"" + lastRow["Major"] + "&</b>";

            Grid1.DataSource = table;
            Grid1.DataBind();
        }



        #endregion



    }
}
