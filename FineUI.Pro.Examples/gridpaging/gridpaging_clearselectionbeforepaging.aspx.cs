using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.gridpaging
{
    public partial class gridpaging_clearselectionbeforepaging : PageBase
    {
        protected void btnSelectCell_Click(object sender, EventArgs e)
        {
            // 106 行在第二页；选择当前客户端渲染页中的单元格。
            PageContext.RegisterStartupScript(Grid1.GetSelectCellReference("106", "Name"));
        }

        protected void btnClearSelections_Click(object sender, EventArgs e)
        {
            PageContext.RegisterStartupScript(Grid1.GetClearSelectionReference());
        }

        protected void btnReadSelection_Click(object sender, EventArgs e)
        {
            var cell = Grid1.SelectedCell;
            var cellText = cell == null || cell.Length == 0 ? "空" : string.Join(",", cell);
            labServerSelection.Text = "选中行数：" + Grid1.SelectedRowIDArray.Length + "；单元格：" + cellText;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        #region LoadData

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable2();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            labResult.Text = "选中行的ID列表为：" + String.Join(", ", Grid1.SelectedRowIDArray);
        }

        #endregion
    }
}
