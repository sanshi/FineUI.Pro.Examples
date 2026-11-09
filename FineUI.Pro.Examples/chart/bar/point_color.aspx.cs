using System;

namespace FineUI.Pro.Examples.chart
{
    public partial class BarPointColor : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ChartBarPointColor.DataSource = new[]
                {
                    new { Category = "Mon", Value = 120, PointColor = "" },
                    new { Category = "Tue", Value = 200, PointColor = "#505372" },
                    new { Category = "Wed", Value = 150, PointColor = "" },
                    new { Category = "Thu", Value = 80, PointColor = "" },
                    new { Category = "Fri", Value = 70, PointColor = "" },
                    new { Category = "Sat", Value = 110, PointColor = "" },
                    new { Category = "Sun", Value = 130, PointColor = "" }
                };
                ChartBarPointColor.DataBind();
            }
        }
    }
}
