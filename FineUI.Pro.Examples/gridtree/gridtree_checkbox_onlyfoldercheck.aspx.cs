using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using Newtonsoft.Json.Linq;

namespace FineUI.Pro.Examples.gridtree
{
    public partial class gridtree_checkbox_onlyfoldercheck : PageBase
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

        protected void btnGetCheckedValues_Click(object sender, EventArgs e)
        {
            GridRow[] rows = Grid1.GetCheckedRows();
            if (rows.Length > 0)
            {
                List<string> checkedTexts = new List<string>();
                foreach (GridRow row in rows)
                {
                    checkedTexts.Add(row.RowText);
                }
                labResult.Text = "复选框选中的值：<ul><li>" + String.Join("</li><li>", checkedTexts) + "</li></ul>";
            }
            else
            {
                labResult.Text = "没有复选框被选中";
            }
        }

        #endregion

    }
}
