using System;

namespace FineUI.Pro.Examples.chart
{
    public partial class LineSmooth : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ChartLineSmooth.DataSource = new[]
                {
                    new { Category = "Mon", Value = 820 },
                    new { Category = "Tue", Value = 932 },
                    new { Category = "Wed", Value = 901 },
                    new { Category = "Thu", Value = 934 },
                    new { Category = "Fri", Value = 1290 },
                    new { Category = "Sat", Value = 1330 },
                    new { Category = "Sun", Value = 1320 }
                };
                ChartLineSmooth.DataBind();
            }
        }
    }
}
