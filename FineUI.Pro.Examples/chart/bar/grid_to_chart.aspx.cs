using System;

namespace FineUI.Pro.Examples.chart
{
    public partial class BarGridToChart : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridRegions.DataSource = RegionSalesData.RegionTotals();
                GridRegions.DataBind();
                BindRegion("east");
            }
        }

        private void BindRegion(string regionKey)
        {
            var region = RegionSalesData.RegionName(regionKey);
            if (region == null)
            {
                return;
            }

            ChartRegionMonths.DataSource = RegionSalesData.RegionTrend(regionKey);
            ChartRegionMonths.DataBind();
            ToolbarTextChartScope.Text = region + " · 月度销售额";
        }

        protected void GridRegions_RowClick(object sender, GridRowClickEventArgs e)
        {
            BindRegion(e.RowID);
        }
    }
}
