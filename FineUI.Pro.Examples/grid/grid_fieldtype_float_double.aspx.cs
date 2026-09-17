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
    public partial class grid_fieldtype_float_double : PageBase
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
            DataTable table = GetSourceData();

            Grid1.DataSource = table;
            Grid1.DataBind();

            Grid2.DataSource = table;
            Grid2.DataBind();
        }

        private DataTable GetSourceData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id", typeof(Int32));
            dt.Columns.Add("Name", typeof(String));
            dt.Columns.Add("Desc", typeof(Decimal));

            DataRow nrow = null;
            nrow = dt.NewRow();
            nrow["Id"] = 1;
            nrow["Name"] = "group1";
            nrow["Desc"] = 101217.760000;
            dt.Rows.Add(nrow);

            nrow = dt.NewRow();
            nrow["Id"] = 2;
            nrow["Name"] = "group2";
            nrow["Desc"] = 142500.230000;
            dt.Rows.Add(nrow);

            nrow = dt.NewRow();
            nrow["Id"] = 3;
            nrow["Name"] = "group3";
            nrow["Desc"] = 142500.28800;
            dt.Rows.Add(nrow);

            return dt;
        }

        #endregion


    }
}
