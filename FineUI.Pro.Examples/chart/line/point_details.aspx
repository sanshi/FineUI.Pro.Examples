<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="point_details.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LinePointDetails" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/DailyVisitData.cs;~/chart/data/ChartDataRows.cs" />
    <title>点击折线点查看详情</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <f:Panel runat="server" Layout="Block" BlockConfigSpace="16" IsFluid="true" ShowHeader="false" ShowBorder="false">
            <Items>
                <f:Panel runat="server" BlockLG="8" Height="550px" Layout="Fit" Title="每日访问量" ShowHeader="true" ShowBorder="true" BodyPadding="8">
                    <Items>
                        <f:Chart runat="server" ID="ChartDailyVisits" DataCategoryField="Category" DataIDField="Id" OnPointClick="ChartDailyVisits_PointClick">
                            <Series>
                                <f:ChartSeries Key="amount" Type="Line" Name="访问量" DataValueField="Amount" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
                <f:SimpleForm runat="server" ID="SimpleFormVisitDetails" BlockLG="4" Height="550px" Title="当日访问详情" ShowHeader="true" ShowBorder="true"
                    BodyPadding="16" LabelWidth="72">
                    <Items>
                        <f:Label runat="server" ID="labVisitDate" Label="日期" Text="—" />
                        <f:Label runat="server" ID="labVisitCount" Label="访问量" Text="—" />
                        <f:Label runat="server" ID="labConversionCount" Label="转化量" Text="—" />
                        <f:Label runat="server" ID="labConversionRate" Label="转化率" Text="—" />
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Panel>



    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>点击折线上的日期点，右侧表单显示当天的访问量、转化量和转化率。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>读取某一天的详情</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartDailyVisits").ClientID %>'
                        title="图表">图表</strong>中的一个日期数据点。<br />结果：后台按该日期更新右侧详情中的日期、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labVisitCount").ClientID %>' title="访问量">访问量</strong>、转化量和<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("labConversionRate").ClientID %>'
                        title="转化率">转化率</strong>；点击另一点可再次更新。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartDailyVisits").ClientID %>' title="图表">图表</strong>）：初始为
                    <code>Id</code>，以完整日期识别记录，例如 2026-09-03。
                </li>
                <li><code>OnPointClick</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartDailyVisits").ClientID %>' title="图表">图表</strong>）：按日期读取完整记录，更新只读表单中的
                    Label。</li>
            </ul>
        </section>
    </template>
</body>
</html>
