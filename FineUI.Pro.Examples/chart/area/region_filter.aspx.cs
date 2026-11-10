using System;

namespace FineUI.Pro.Examples.chart
{
    public partial class AreaRegionFilter : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRegions(cblRegions.SelectedValueArray);
            }
        }

        private void BindRegions(string[] regionKeys)
        {
            var totals = ChartInteractionData.RegionTrend(regionKeys);
            ChartAreaSales.DataSource = totals;
            ChartAreaSales.DataBind();
            ToolbarTextChartScope.Text = ChartInteractionData.AreaSummary(totals);
        }

        protected void cblRegions_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRegions(cblRegions.SelectedValueArray);
        }
    }
}
