using System;

namespace FineUI.Pro.Examples.chart
{
    public partial class PieMonthFilter : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var rows = ChartInteractionData.ChannelDistribution("all");
                ChartChannelMonth.DataSource = rows;
                ChartChannelMonth.DataBind();
                ToolbarTextChartScope.Text = ChartInteractionData.DistributionSummary("all", rows);
            }
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            var month = ddlMonth.SelectedValue;
            var rows = ChartInteractionData.ChannelDistribution(month);
            if (rows.Length > 0)
            {
                ChartChannelMonth.DataSource = rows;
                ChartChannelMonth.DataBind();
                ToolbarTextChartScope.Text = ChartInteractionData.DistributionSummary(month, rows);
            }
        }
    }
}
