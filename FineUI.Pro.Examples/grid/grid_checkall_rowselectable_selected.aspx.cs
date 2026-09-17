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
    public partial class grid_checkall_rowselectable_selected : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();

                // 默认选中不可选择行
                Grid1.SelectedRowIDArray = new string[] { "103", "105" };
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

                // 由于本行是禁用样式，把 所学专业 列的链接也去掉
                e.SetCellValue("Major", row["Major"].ToString());

                //HyperLinkField majorField = Grid1.FindColumn("Major") as HyperLinkField;
                //e.Values[majorField.ColumnIndex] = row["Major"].ToString();
            }
        }

        #endregion
    }
}
