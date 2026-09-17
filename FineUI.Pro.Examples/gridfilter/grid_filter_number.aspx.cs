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
    public partial class grid_filter_number : PageBase
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

            string fillteredOperator = filteredItem.Operator;
            if (columnID == "EntranceYear")
            {
                int sourceValue = Convert.ToInt32(sourceObj);
                int fillteredValue = Convert.ToInt32(filteredItem.Value);

                if (fillteredOperator == "greater")
                {
                    if (sourceValue > fillteredValue)
                    {
                        valid = true;
                    }
                }
                else if (fillteredOperator == "less")
                {
                    if (sourceValue < fillteredValue)
                    {
                        valid = true;
                    }
                }
                else if (fillteredOperator == "equal")
                {
                    if (sourceValue == fillteredValue)
                    {
                        valid = true;
                    }
                }

            }
            else if (columnID == "LogTime")
            {
                // 时间比较时要去掉数据源中的时分秒！
                DateTime sourceDate = Convert.ToDateTime(sourceObj);
                DateTime sourceValue = new DateTime(sourceDate.Year, sourceDate.Month, sourceDate.Day);
                
                DateTime fillteredValue = Convert.ToDateTime(filteredItem.Value);

                if (fillteredOperator == "greater")
                {
                    if (sourceValue > fillteredValue)
                    {
                        valid = true;
                    }
                }
                else if (fillteredOperator == "less")
                {
                    if (sourceValue < fillteredValue)
                    {
                        valid = true;
                    }
                }
                else if (fillteredOperator == "equal")
                {
                    if (sourceValue == fillteredValue)
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
