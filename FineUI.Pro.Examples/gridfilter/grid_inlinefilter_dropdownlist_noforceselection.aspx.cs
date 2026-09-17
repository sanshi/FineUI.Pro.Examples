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
    public partial class grid_inlinefilter_dropdownlist_noforceselection : PageBase
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
            NewFilteredTable filteredTable = new NewFilteredTable();
            filteredTable.FilterDataRowItem = FilterDataRowItemImplement;

            DataTable table = filteredTable.GetFilteredTable(Grid1);

            Grid1.DataSource = table;
            Grid1.DataBind();

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

                // 下拉列表的值是数组，并且数组不为空
                if (filteredItem.Value != null)
                {
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
                else
                {
                    // 下拉列表，用户输入值
                    if (sourceValue.Contains(filteredItem.Text))
                    {
                        valid = true;
                    }
                }

            }


            return valid;
        }

        #endregion

    }
}
