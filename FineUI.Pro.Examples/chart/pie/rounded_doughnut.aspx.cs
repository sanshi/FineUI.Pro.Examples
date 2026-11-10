using System;

namespace FineUI.Pro.Examples.chart
{
    public partial class PieRoundedDoughnut : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ChartPieRoundedDoughnut.DataSource = new[]
                {
                    new { Category = "Search Engine", Value = 1048 },
                    new { Category = "Direct", Value = 735 },
                    new { Category = "Email", Value = 580 },
                    new { Category = "Union Ads", Value = 484 },
                    new { Category = "Video Ads", Value = 300 }
                };
                ChartPieRoundedDoughnut.DataBind();
            }
        }
    }
}
