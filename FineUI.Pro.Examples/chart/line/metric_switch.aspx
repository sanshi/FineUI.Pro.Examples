<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="metric_switch.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineMetricSwitch" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/ChartInteractionData.cs" />
    <title>单选切换折线指标</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" IsFluid="true" Title="每日指标趋势" ShowHeader="true" ShowBorder="true" BodyPadding="8">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:SimpleForm runat="server" IsFluid="true" ShowHeader="false" ShowBorder="false" LabelWidth="108">
                    <Items>
                        <f:RadioButtonList runat="server" ID="rblMetric" Label="指标" ColumnNumber="2" OnSelectedIndexChanged="ChangeMetric">
                            <f:RadioItem Text="访问量" Value="visits" Selected="true" />
                            <f:RadioItem Text="转化量" Value="conversions" />
                        </f:RadioButtonList>
                    </Items>
                </f:SimpleForm>
                <f:Chart runat="server" ID="ChartMetricTrend" Height="550px" CategoryField="Category">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Line" Name="人数" ValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>

        <p>选择「访问量」或「转化量」，在同一张折线图上查看对应指标。日期范围保持一致，汇总随指标更新。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li><code>RadioButtonList</code> 使用稳定选项键 visits 和 conversions 切换统计口径。</li>
                <li><code>OnSelectedIndexChanged</code> 选项改变后重新绑定系列数值，分类日期保持一致。</li>
            </ul>
        </section>
    </form>
</body>
</html>
