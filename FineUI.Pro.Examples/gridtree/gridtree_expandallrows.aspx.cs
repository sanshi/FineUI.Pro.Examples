using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Pro.Examples.gridtree
{
    public partial class gridtree_expandallrows : PageBase
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
            DataTable table = DataSourceUtil.GetTreeDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }

        #endregion

        #region Events

        //protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        //{
        //    DataRowView row = e.DataItem as DataRowView;

        //    string dataType = row["Type"].ToString();
        //    if (dataType == "文件夹")
        //    {
        //        e.TreeNodeExpanded = true;
        //    }
        //}

        #endregion

    }
}
