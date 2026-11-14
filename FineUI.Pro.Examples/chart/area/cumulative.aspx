<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cumulative.aspx.cs" Inherits="FineUI.Pro.Examples.chart.AreaCumulative" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/RegionSalesData.cs;~/chart/data/ChartDataRows.cs" />
    <title>复选切换累计面积图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" IsFluid="true" Title="区域销售趋势" ShowHeader="true" ShowBorder="true" BodyPadding="8">
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
                        <f:CheckBox runat="server" ID="cbxCumulative" ShowLabel="false" Text="按月累计" OnCheckedChanged="cbxCumulative_CheckedChanged" />
                    </Items>
                </f:SimpleForm>
                <f:Chart runat="server" ID="ChartCumulativeSales" Height="550px" DataCategoryField="Category">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Area" Name="销售额（元）" DataValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>



    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>勾选「按月累计」，面积图每个点显示从 4 月到该月的销售额合计。取消勾选恢复每月独立金额。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换累计口径</h3>
    <ol>
        <li>勾选<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxCumulative").ClientID %>' title="按月累计">按月累计</strong>。<br />结果：后台重新计算每个点：显示从 4 月到该月的累计销售额，汇总口径同步改变。</li>
        <li>取消勾选。<br />结果：恢复每个月各自的独立金额。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>OnCheckedChanged</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbxCumulative").ClientID %>' title="按月累计">按月累计</strong>）：用当前复选状态选择本月值或截至当月累计值。</li>
        <li><code>DataBind</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartCumulativeSales").ClientID %>' title="图表">图表</strong>）：累计由后台按月份顺序计算。例如 4 月与 5 月相加后才得到 5 月的累计值。</li>
    </ul>
</section>
</template>
</body>
</html>
