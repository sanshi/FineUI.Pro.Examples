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
    public partial class gridtree_icons : PageBase
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

        #endregion

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            if (e.RowID == "50" || e.RowID == "60" || e.RowID == "63" || e.RowID == "64")
            {
                e.TreeNodeExpanded = true;
            }

            DataRowView row = e.DataItem as DataRowView;
            string name = row["Name"].ToString();
            int lastDotIndex = name.LastIndexOf(".");
            if (lastDotIndex >= 0)
            {
                string fileType = name.Substring(lastDotIndex + 1).ToLower();

                if (fileType == "png" || fileType == "ico" || fileType == "gif")
                {
                    e.TreeNodeIconFont = IconFont._Pic;
                }
                else
                {
                    e.TreeNodeIconUrl = String.Format("~/res/images/filetype/vs_{0}.png", fileType);
                }
            }
        }

    }
}
