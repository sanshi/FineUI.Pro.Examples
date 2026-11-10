using System;
using System.Linq;
using ChartRow = FineUI.Pro.Examples.chart.ChartDataRows.ChartRow;

namespace FineUI.Pro.Examples.chart
{
    public partial class LineMetricSwitch : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var rows = DailyMetric("visits");
                ChartMetricTrend.DataSource = rows;
                ChartMetricTrend.DataBind();
                ToolbarTextChartScope.Text = MetricSummary("visits", rows);
            }
        }

        protected void rblMetric_SelectedIndexChanged(object sender, EventArgs e)
        {
            var metric = rblMetric.SelectedValue;
            var rows = DailyMetric(metric);
            ChartMetricTrend.DataSource = rows;
            ChartMetricTrend.DataBind();
            ToolbarTextChartScope.Text = MetricSummary(metric, rows);
        }

        private static ChartRow[] DailyMetric(string metric)
        {
            var rows = DailyVisitData.DailyVisits();
            return metric == "conversions"
                ? rows.Select(row => new ChartRow(row.Key, row.Category, DailyVisitData.FindVisit(row.Key).Conversions)).ToArray()
                : rows;
        }

        private static string MetricSummary(string metric, ChartRow[] rows)
        {
            var name = metric == "conversions" ? "转化量" : "访问量";
            return $"{name}合计：{rows.Sum(row => row.Amount)}";
        }
    }
}
