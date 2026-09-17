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
    public partial class grid_filter_dynamic_columns : PageBase
    {
        #region Page_Init

        // 注意：动态创建的代码需要放置于Page_Init（不是Page_Load），这样每次构造页面时都会执行
        protected void Page_Init(object sender, EventArgs e)
        {
            InitGrid();
        }

        private void InitGrid()
        {
            var rnf = new FineUI.Pro.RowNumberField();
            Grid1.Columns.Add(rnf);

            FineUI.Pro.BoundField bf;

            bf = new FineUI.Pro.BoundField();
            bf.ColumnID = "Name";
            bf.DataField = "Name";
            bf.DataFormatString = "{0}";
            bf.HeaderText = "姓名";
            bf.EnableFilter = true;
            // 自定义过滤器
            DropDownList ddlOperator = new DropDownList();
            ddlOperator.Items.Add("等于", "equal");
            ddlOperator.Items.Add("包含", "contain");
            ddlOperator.Items.Add("开始于", "start");
            ddlOperator.Items.Add("结束于", "end");
            ddlOperator.SelectedValue = "contain";
            bf.Filter.Operator.Add(ddlOperator);
            Grid1.Columns.Add(bf);


            bf = new FineUI.Pro.BoundField();
            bf.ColumnID = "EntranceYear";
            bf.DataField = "EntranceYear";
            bf.DataFormatString = "{0}";
            bf.HeaderText = "入学年份";
            Grid1.Columns.Add(bf);

            FineUI.Pro.CheckBoxField cbf = new FineUI.Pro.CheckBoxField();
            cbf.ColumnID = "AtSchool";
            cbf.RenderAsStaticField = true;
            cbf.DataField = "AtSchool";
            cbf.HeaderText = "是否在校";
            Grid1.Columns.Add(cbf);

            bf = new FineUI.Pro.BoundField();
            bf.ColumnID = "Major";
            bf.DataToolTipField = "Major";
            bf.DataField = "Major";
            bf.DataFormatString = "{0}";
            bf.HeaderText = "所学专业";
            bf.ExpandUnusedSpace = true;
            Grid1.Columns.Add(bf);

            FineUI.Pro.ImageField imageField = new FineUI.Pro.ImageField();
            imageField.ColumnID = "Group";
            imageField.DataImageUrlField = "Group";
            imageField.DataImageUrlFormatString = "~/res/images/16/{0}.png";
            imageField.HeaderText = "分组";
            Grid1.Columns.Add(imageField);

            bf = new FineUI.Pro.BoundField();
            bf.ColumnID = "LogTime";
            bf.DataField = "LogTime";
            bf.DataFormatString = "{0:yyyy/MM/dd}";
            bf.HeaderText = "注册日期";
            Grid1.Columns.Add(bf);

        }

        #endregion

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
