using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_filter_dropdownbox : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();

                BindGrid2();
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            NewFilteredTable filteredTable = new NewFilteredTable();
            filteredTable.FilterDataRowItem = FilterDataRowItemImplement;

            DataTable table = filteredTable.GetFilteredTable(Grid1);

            Grid1.DataSource = table;
            Grid1.DataBind();

        }


        private void BindGrid2()
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Id", typeof(int)));
            table.Columns.Add(new DataColumn("Name", typeof(string)));

            DataRow row = null;

            row = table.NewRow();
            row[0] = 1;
            row[1] = "材料科学与工程系";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 2;
            row[1] = "化学系";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 3;
            row[1] = "物理系";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 4;
            row[1] = "数学系";
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 5;
            row[1] = "自动化系";
            table.Rows.Add(row);

            Grid2.DataSource = table;
            Grid2.DataBind();
        }

        #endregion

        #region Events

        protected void Grid1_FilterChanged(object sender, EventArgs e)
        {
            BindGrid();

            labResult.Text = String.Format("过滤数据：<pre>{0}</pre>", EncodeJson(Grid1.FilteredData));
        }

        #endregion

        #region FilterDataRowItemImplement

        private bool FilterDataRowItemImplement(object sourceObj, GridColumnFilteredItem filteredItem, string columnID)
        {
            bool valid = false;

            if (columnID == "Major")
            {
                string sourceValue = sourceObj.ToString();
                string[] fillteredValue = (string[])filteredItem.Value;

                foreach (string filltereditem in fillteredValue)
                {
                    if (filltereditem == sourceValue)
                    {
                        valid = true;
                        break;
                    }
                }
            }

            return valid;
        }

        #endregion

    }
}
