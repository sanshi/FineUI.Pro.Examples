<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="point_details.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LinePointDetails" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/DailyVisitData.cs;~/chart/data/ChartDataRows.cs" />
    <title>点击折线点查看详情</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <f:Panel runat="server" IsFluid="true" Title="每日访问量" ShowHeader="true" ShowBorder="true" BodyPadding="8">
            <Items>
                <f:Chart runat="server" ID="ChartDailyVisits" Height="550px" DataCategoryField="Category" DataIDField="Id" OnPointClick="ChartDailyVisits_PointClick">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Line" Name="访问量" DataValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="WindowVisitDetails" Title="访问详情" Hidden="true" IsModal="true" EnableClose="true" Width="320px" Height="210px" BodyPadding="16">
            <Items>
                <f:Label runat="server" ID="labVisitDate" ShowLabel="false" />
                <f:Label runat="server" ID="labVisitCount" ShowLabel="false" />
                <f:Label runat="server" ID="labConversionCount" ShowLabel="false" />
                <f:Label runat="server" ID="labConversionRate" ShowLabel="false" />
            </Items>
        </f:Window>

        <p>点击折线上的日期数据点，弹出当日访问量、转化量和转化率。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li><code>DataIDField="Id"</code> 以完整日期识别记录，例如 2026-09-03。</li>
                <li><code>OnPointClick</code> 后台按日期读取完整记录，填充详情 Window，再打开窗口。</li>
            </ul>
        </section>
    </form>
</body>
</html>
