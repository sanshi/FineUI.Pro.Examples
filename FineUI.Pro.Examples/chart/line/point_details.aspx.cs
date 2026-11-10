using System.Globalization;
using System;

namespace FineUI.Pro.Examples.chart
{
    public partial class LinePointDetails : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ChartDailyVisits.DataSource = DailyVisitData.DailyVisits();
                ChartDailyVisits.DataBind();
            }
        }

        protected void ChartDailyVisits_PointClick(object sender, ChartPointEventArgs e)
        {
            var details = DailyVisitData.FindVisit(e.PointID);
            if (details == null)
            {
                return;
            }

            labVisitDate.Text = e.PointID;
            labVisitCount.Text = details.Visits.ToString(CultureInfo.InvariantCulture);
            labConversionCount.Text = details.Conversions.ToString(CultureInfo.InvariantCulture);
            var rate = (details.Conversions * 100.0 / details.Visits).ToString("0.0", CultureInfo.InvariantCulture);
            labConversionRate.Text = rate + "%";
        }
    }
}
