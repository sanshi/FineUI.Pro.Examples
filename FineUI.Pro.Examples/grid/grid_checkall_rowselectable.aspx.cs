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
    public partial class grid_checkall_rowselectable : PageBase
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
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        #region Event

        /// <summary>
        /// 选中了哪些行
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            foreach (object[] dataKeys in Grid1.GetSelectedDataKeys())
            {
                sb.AppendFormat("用户名:{0}<br />", dataKeys[1]);
            }
            labResult.Text = sb.ToString();

            //labResult.Text = GridSelectionMessage.HowManyRowsAreSelected(Grid1);
        }

        #endregion

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            // e.DataItem  -> System.Data.DataRowView or custom class.
            // e.RowIndex -> Current row index.
            // e.Values -> Rendered html for each column of this row.

            DataRowView row = e.DataItem as DataRowView;
            int entranceYear = Convert.ToInt32(row["EntranceYear"]);

            if (entranceYear >= 2008)
            {
                e.RowSelectable = false;
            }
        }
    }
}
