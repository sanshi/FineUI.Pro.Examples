using System;
using System.Data;

namespace FineUI.Pro.Examples.grid_server_render
{
    public partial class image_field : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable table = DataSourceUtil.GetDataTable();
                Grid1.DataSource = table;
                Grid1.DataBind();
            }
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            labResult.Text = String.Format("行 ID：{0}，行命令：{1}", Grid1.Rows[e.RowIndex].RowID, e.CommandName);
        }
    }
}
