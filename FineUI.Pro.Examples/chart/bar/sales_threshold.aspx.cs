using System;

namespace FineUI.Pro.Examples.chart
{
    public partial class BarSalesThreshold : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                nbxMinimum.Text = "0";
                var rows = ChartInteractionData.RegionThreshold("0");
                ChartSalesThreshold.DataSource = rows;
                ChartSalesThreshold.DataBind();
                ToolbarTextChartScope.Text = ChartInteractionData.ThresholdSummary(rows);
            }
        }

        protected void FilterSales(object sender, EventArgs e)
        {
            var minimum = nbxMinimum.Text;
            var rows = ChartInteractionData.RegionThreshold(minimum);
            if (rows != null)
            {
                ChartSalesThreshold.DataSource = rows;
                ChartSalesThreshold.DataBind();
            }
            ToolbarTextChartScope.Text = ChartInteractionData.ThresholdSummary(rows);
        }
    }
}
