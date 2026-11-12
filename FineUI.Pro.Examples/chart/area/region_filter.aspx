<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="region_filter.aspx.cs" Inherits="FineUI.Pro.Examples.chart.AreaRegionFilter" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/RegionSalesData.cs;~/chart/data/ChartDataRows.cs" />
    <title>复选筛选面积图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <f:Panel runat="server" IsFluid="true" Title="所选区域月度销售额（元）" ShowHeader="true" ShowBorder="true" BodyPadding="8">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:CheckBoxList runat="server" ID="cblRegions" ShowLabel="false" AutoColumnWidth="true" OnSelectedIndexChanged="cblRegions_SelectedIndexChanged">
                    <f:CheckItem Text="华东" Value="east" Selected="true" />
                    <f:CheckItem Text="华北" Value="north" />
                    <f:CheckItem Text="华南" Value="south" />
                    <f:CheckItem Text="华中" Value="central" />
                    <f:CheckItem Text="西南" Value="southwest" />
                    <f:CheckItem Text="西北" Value="northwest" />
                </f:CheckBoxList>
                <f:Chart runat="server" ID="ChartAreaSales" Height="550px" DataCategoryField="Category">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Area" Name="销售额（元）" DataValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>



    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>勾选一个或多个区域，面积图展示所选区域每个月的销售额合计。取消全部勾选会清空图表。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>组合区域并清空</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cblRegions").ClientID %>' title="复选框列表">复选框列表</strong>勾选一个或多个区域。<br />结果：后台按月份合计所选区域销售额，面积图和汇总同步更新。</li>
        <li>取消全部勾选。<br />结果：图表清空，不把未选择解释为全部区域。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>OnSelectedIndexChanged</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cblRegions").ClientID %>' title="复选框列表">复选框列表</strong>）：选项变动时立即提交当前完整选项集合，后台按月合计。</li>
        <li><code>DataBind()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartAreaSales").ClientID %>' title="图表">图表</strong>）：空选择对应空结果，后台提交空数据以清除原来的面积。</li>
    </ul>
</section>
</template>
</body>
</html>
