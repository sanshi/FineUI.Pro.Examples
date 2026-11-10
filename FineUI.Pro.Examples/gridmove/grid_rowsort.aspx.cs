using System;

namespace FineUI.Pro.Examples.grid
{
    public partial class grid_rowsort : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Grid1.DataSource = new[]
                {
                    new { Id = "requirements", Name = "需求确认" },
                    new { Id = "design", Name = "设计评审" },
                    new { Id = "implementation", Name = "开发实现" },
                    new { Id = "delivery", Name = "交付验收" }
                };
                Grid1.DataBind();
            }
        }
    }
}
