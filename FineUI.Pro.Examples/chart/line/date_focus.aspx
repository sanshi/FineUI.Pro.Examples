<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="date_focus.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineDateFocus" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/DailyVisitData.cs;~/chart/data/ChartDataRows.cs" />
    <title>折线图与日期选择器双向联动</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" IsFluid="true" Title="每日访问量" ShowHeader="true" ShowBorder="true" BodyPadding="8">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:SimpleForm runat="server" IsFluid="true" MaxWidth="240px" ShowHeader="false" ShowBorder="false" LabelWidth="64">
                    <Items>
                        <f:DatePicker runat="server" ID="dpFocus" Label="日期" DateFormatString="yyyy-MM-dd"
                            EnableEdit="false" OnTextChanged="dpFocus_TextChanged" />
                    </Items>
                </f:SimpleForm>
                <f:Chart runat="server" ID="ChartDateFocus" Height="550px" DataCategoryField="Category" DataIDField="Id" OnPointClick="ChartDateFocus_PointClick">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Line" Name="访问量" DataValueField="Amount" />
                        <f:ChartSeries Key="focus" Type="Line" Name="选中日期" DataValueField="FocusAmount"
                            DataColorField="Color" ShowLabel="true" ShowTooltip="false" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>

        <p>点击折线上的日期点，日期选择器会同步更新。也可以在日历里选一天，图上的橙色标记和访问量标签会随即移到当天。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li><code>DataIDField</code> 折线点提交完整日期，例如 2026-09-03，后台按该日期填写日期选择器。</li>
                <li><code>OnTextChanged</code> 选择日期后立即更新图表与当天摘要。</li>
                <li><code>DataValueField="FocusAmount"</code> 配合 <code>ShowLabel="true"</code>。标记系列仅为所选日期绑定访问量，例如选择 9 月 6 日时只在该点显示 980，整条趋势保留。</li>
            </ul>
        </section>
    </form>
</body>
</html>
