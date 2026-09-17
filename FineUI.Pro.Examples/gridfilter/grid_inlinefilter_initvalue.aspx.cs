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
    public partial class grid_inlinefilter_initvalue : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //// 初始化列的过滤数据
                var columnName = Grid1.FindColumn("Name");
                columnName.ColumnFilteredData = new GridColumnFilteredData()
                {
                    Items = {
                        new GridColumnFilteredItem() { Value = "张" }
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
                Items = {
                    new GridColumnFilteredItem() { Value = "婷婷" }
                }
            };

            BindGrid();

            labResult.Text = String.Format("后台更新过滤数据：<pre>{0}</pre>", EncodeJson(Grid1.FilteredData));
        }

        #endregion

        #region FilterDataRowItem

        private bool FilterDataRowItemImplement(object sourceObj, GridColumnFilteredItem filteredItem, string columnID)
        {
            bool valid = false;

            if (columnID == "Name")
            {
                string sourceValue = sourceObj.ToString();
                string fillteredValue = filteredItem.Value.ToString();

                if (sourceValue.Contains(fillteredValue))
                {
                    valid = true;
                }
            }

            return valid;
        } 

        #endregion

    }
}
