using System;

namespace FineUI.Pro.Examples.chart
{
    public partial class PieRose : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ChartPieRose.DataSource = new[]
                {
                    new { Category = "A", Value = 100 },
                    new { Category = "B", Value = 200 },
                    new { Category = "C", Value = 300 },
                    new { Category = "D", Value = 400 },
                    new { Category = "E", Value = 500 }
                };
                ChartPieRose.DataBind();
            }
        }
    }
}
