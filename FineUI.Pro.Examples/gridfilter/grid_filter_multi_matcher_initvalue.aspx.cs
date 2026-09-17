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
    public partial class grid_filter_multi_matcher_initvalue : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 初始化列的过滤数据
                var columnName = Grid1.FindColumn("Name");
                columnName.ColumnFilteredData = new GridColumnFilteredData()
                {
                    Multi = true,
                    Matcher = "any",
                    Items = {
                        new GridColumnFilteredItem() {
                            Operator = "start",
                            Value = "张"
                        },
                        new GridColumnFilteredItem() {
                            Operator = "end",
                            Value = "国"
                        }
                    }
                };


                BindGrid();

                labResult.Text = String.Format("初始过滤数据：<pre>{0}</pre>", EncodeJson(Grid1.FilteredData));
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

        protected void btnUpdateFilteredData_Click(object sender, EventArgs e)
        {
            // 先清空过滤数据
            Grid1.FilteredData = null;

            // 初始化列的过滤数据
            var columnName = Grid1.FindColumn("Name");
            columnName.ColumnFilteredData = new GridColumnFilteredData()
            {
                Multi = true,
                Matcher = "any",
                Items = {
                    new GridColumnFilteredItem() {
                        Operator = "contain",
                        Value = "婷婷"
                    },
                    new GridColumnFilteredItem() {
                        Operator = "end",
                        Value = "国"
                    }
                }
            };


            BindGrid();

            labResult.Text = String.Format("后台更新过滤数据：<pre>{0}</pre>", EncodeJson(Grid1.FilteredData));
        }

        #endregion

        #region FilterDataRowItemImplement

        private bool FilterDataRowItemImplement(object sourceObj, GridColumnFilteredItem filteredItem, string columnID)
        {
            bool valid = false;

            string fillteredOperator = filteredItem.Operator;
            if (columnID == "Name")
            {
                string sourceValue = sourceObj.ToString();
                string fillteredValue = filteredItem.Value.ToString();

                if (fillteredOperator == "equal")
                {
                    if (sourceValue == fillteredValue)
                    {
                        valid = true;
                    }
                }
                else if (fillteredOperator == "contain")
                {
                    if (sourceValue.Contains(fillteredValue))
                    {
                        valid = true;
                    }
                }
                else if (fillteredOperator == "start")
                {
                    if (sourceValue.StartsWith(fillteredValue))
                    {
                        valid = true;
                    }
                }
                else if (fillteredOperator == "end")
                {
                    if (sourceValue.EndsWith(fillteredValue))
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
