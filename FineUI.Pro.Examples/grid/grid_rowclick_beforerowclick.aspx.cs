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
    public partial class grid_rowclick_beforerowclick : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        #region LoadData

        private void LoadData()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        #region Events


        protected void Grid1_RowClick(object sender, GridRowClickEventArgs e)
        {
            object[] keys = Grid1.DataKeys[e.RowIndex];

            string message = String.Format("你单击了第 {0} 行，行ID：{1}，姓名：{2}", e.RowIndex + 1, keys[0], keys[1]);

            // 选中单元格所在的行
            if (Grid1.SelectedCell != null && Grid1.SelectedCell.Length > 0)
            {
                message += String.Format("，列：{0}", Grid1.SelectedCell[1]);
            }

            ShowNotify(message);
        }

        #endregion


    }
}
