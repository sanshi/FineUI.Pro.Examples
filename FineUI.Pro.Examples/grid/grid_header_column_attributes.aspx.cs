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
    public partial class grid_header_column_attributes : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var columnName = Grid1.FindColumn("Name") as FineUI.Pro.BoundField;
                columnName.Attributes["data-header-color"] = "color1";

                var columnGender = Grid1.FindColumn("Gender") as FineUI.Pro.TemplateField;
                columnGender.Attributes["data-header-color"] = "color1";


                BindGrid();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();
            
            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        

        #endregion



    }
}
