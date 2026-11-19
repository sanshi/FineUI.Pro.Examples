<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="date_focus.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineDateFocus" %>

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
                        <f:DatePicker runat="server" ID="dpFocus" Label="日期" DateFormatString="yyyy-MM-dd" EnableEdit="false"
                            OnTextChanged="dpFocus_TextChanged" />
                    </Items>
                </f:SimpleForm>
                <f:Chart runat="server" ID="ChartDateFocus" Height="550px" DataCategoryField="Category" DataIDField="Id"
                    OnPointClick="ChartDateFocus_PointClick">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Line" Name="访问量" DataValueField="Amount" />
                        <f:ChartSeries Key="focus" Type="Line" Name="选中日期" DataValueField="FocusAmount" DataColorField="Color" ShowLabel="true"
                            ShowTooltip="false" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>



    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>点击折线上的日期点，日期选择器会同步更新。也可以在日历里选一天，图上的橙色标记和访问量标签会随即移到当天。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>双向选择日期</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartDateFocus").ClientID %>'
                        title="图表">图表</strong>的一个日期点。<br />结果：日期选择框同步为所点日期，橙色标记和访问量提示定位到当天。</li>
                <li>从<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("dpFocus").ClientID %>'
                        title="日期">日期</strong>选择演示范围内的另一日期。<br />结果：图中橙色标记与访问量提示随选择移动，日期范围内的原始折线保持。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartDateFocus").ClientID %>' title="图表">图表</strong>）：折线点提交完整日期，例如
                    2026-09-03，后台按该日期填写日期选择器。</li>
                <li><code>OnTextChanged</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("dpFocus").ClientID %>' title="日期">日期</strong>）：选择日期后立即更新图表与当天摘要。</li>
                <li><code>DataValueField / ShowLabel</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartDateFocus").ClientID %>' title="图表">图表</strong>）：初始分别为
                    <code>FocusAmount</code>、<code>true</code>，配合 。标记系列仅为所选日期绑定访问量，例如选择 9 月 6 日时只在该点显示 980，整条趋势保留。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
