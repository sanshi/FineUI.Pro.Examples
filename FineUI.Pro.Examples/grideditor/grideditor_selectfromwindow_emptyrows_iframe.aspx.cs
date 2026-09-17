using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grideditor
{
    public partial class grideditor_selectfromwindow_emptyrows_iframe : PageBase
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
            DataTable table = DataSourceUtil.GetDataTable();

            DataView view = table.DefaultView;

            List<string> filters = new List<string>();
            
            string searchKeyword = ttbSearch.Text.Trim();
            if (!String.IsNullOrEmpty(searchKeyword))
            {
                filters.Add(String.Format("Name LIKE '*{0}*'", DataSourceUtil.EscapeLikeValue(searchKeyword)));
            }

            if (rblAtSchool.SelectedValue != "all")
            {
                filters.Add(String.Format("AtSchool = {0}", rblAtSchool.SelectedValue == "in" ? "true" : "false"));
            }


            // RowFilter的用法：http://www.csharp-examples.net/dataview-rowfilter/
            if (filters.Count > 0)
            {
                view.RowFilter = String.Join(" AND ", filters.ToArray());
            }


            Grid1.DataSource = view.ToTable();
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }


        protected void ttbSearch_Trigger1Click(object sender, EventArgs e)
        {
            ttbSearch.Text = String.Empty;
            ttbSearch.ShowTrigger1 = false;

            BindGrid();
        }

        protected void ttbSearch_Trigger2Click(object sender, EventArgs e)
        {
            ttbSearch.ShowTrigger1 = true;

            BindGrid();
        }

        
        #endregion
    }
}
