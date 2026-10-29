using System;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_rowcommand_window : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Grid1.DataSource = new[]
                {
                    new { ID = 105, Slug = "customer-105", DisplayName = "张三" },
                    new { ID = 106, Slug = "customer-106", DisplayName = "李四" }
                };
                Grid1.DataBind();
            }
        }
    }
}
