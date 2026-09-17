using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_sorting_cancel : PageBase
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
            string sortField = Grid1.SortField;
            string sortDirection = Grid1.SortDirection;

            DataTable table = DataSourceUtil.GetDataTable();

            // 判断是否启用排序
            if (!String.IsNullOrEmpty(sortField))
            {
                DataView view1 = table.DefaultView;
                view1.Sort = String.Format("{0} {1}", sortField, sortDirection);
                Grid1.DataSource = view1;
            }
            else
            {
                Grid1.DataSource = table;
            }
            
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void Grid1_Sort(object sender, GridSortEventArgs e)
        {
            //Grid1.SortDirection = e.SortDirection;
            //Grid1.SortField = e.SortField;

            BindGrid();
        }

        #endregion

    }
}
