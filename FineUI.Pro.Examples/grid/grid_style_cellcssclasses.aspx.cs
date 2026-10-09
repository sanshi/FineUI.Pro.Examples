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
    public partial class grid_style_cellcssclasses : PageBase
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
            ViewState["UseDataSource1"] = true;

            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        #region Grid1

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            // e.DataItem  -> System.Data.DataRowView 或自定义类。
            // e.RowIndex -> 当前行索引。
            // e.Values -> 当前行各列的数据。

            DataRowView row = e.DataItem as DataRowView;

            // 入学年份
            int entranceYear = Convert.ToInt32(row["EntranceYear"]);
            //RenderField cEntranceYear = Grid1.FindColumn("cEntranceYear") as RenderField;
            if (entranceYear >= 2000 && entranceYear <= 2004)
            {
                e.SetCellCssClass("cEntranceYear", "color3");
                //e.CellCssClasses[cEntranceYear.ColumnIndex] = "color3";
            }

            // 性别
            int gender = Convert.ToInt32(row["Gender"]);
            //RenderField cGender = Grid1.FindColumn("cGender") as RenderField;
            if (gender == 1)
            {
                e.SetCellCssClass("cGender", "color1");
                //e.CellCssClasses[cGender.ColumnIndex] = "color1";
            }
        }

        #endregion

        #region Event

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable table;
            if (Convert.ToBoolean(ViewState["UseDataSource1"]))
            {
                ViewState["UseDataSource1"] = false;
                table = DataSourceUtil.GetDataTable2();
            }
            else
            {
                ViewState["UseDataSource1"] = true;
                table = DataSourceUtil.GetDataTable();
            }

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

    }
}
