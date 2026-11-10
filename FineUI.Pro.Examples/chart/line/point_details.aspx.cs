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

            labVisitDate.Text = "日期：" + e.PointID;
            labVisitCount.Text = "访问量：" + details.Visits;
            labConversionCount.Text = "转化量：" + details.Conversions;
            var rate = (details.Conversions * 100.0 / details.Visits).ToString("0.0", CultureInfo.InvariantCulture);
            labConversionRate.Text = "转化率：" + rate + "%";
            WindowVisitDetails.Hidden = false;
        }
    }
}
