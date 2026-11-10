using System;

namespace FineUI.Pro.Examples.chart
{
    public partial class AreaCumulative : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var rows = ChartInteractionData.AreaAmounts(false);
                ChartCumulativeSales.DataSource = rows;
                ChartCumulativeSales.DataBind();
                ToolbarTextChartScope.Text = ChartInteractionData.AreaModeSummary(false);
            }
        }

        protected void ChangeAreaMode(object sender, EventArgs e)
        {
            var cumulative = cbxCumulative.Checked;
            var rows = ChartInteractionData.AreaAmounts(cumulative);
            ChartCumulativeSales.DataSource = rows;
            ChartCumulativeSales.DataBind();
            ToolbarTextChartScope.Text = ChartInteractionData.AreaModeSummary(cumulative);
        }
    }
}
