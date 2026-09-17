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
    public partial class grid_checkall_keepcurrentselection : PageBase
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

        /// <summary>
        /// 选中第 2, 6, 8 行
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            Grid1.SelectedRowIDArray = new string[] { "102", "106", "108" };
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "Action1" || e.CommandName == "Action2" || e.CommandName == "Action3")
            {
                object[] keys = Grid1.DataKeys[e.RowIndex];
                labResult.Text = String.Format("你点击了第 {0} 行，第 {1} 列，行命令是 {2}", e.RowIndex + 1, e.ColumnIndex + 1, e.CommandName) +
                       "<br />" +
                       String.Format("当前行数据 - 编号：{0}，姓名：{1}", keys[0], keys[1]);
            }
        }

        #endregion
    }
}
