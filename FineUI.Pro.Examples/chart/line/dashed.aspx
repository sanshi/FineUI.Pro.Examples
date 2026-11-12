<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="dashed.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineDashed" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>虚线折线图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartLineDashed" runat="server" Height="550px" DataCategoryField="Category"
            ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="value" Type="Line" Name="value" DataValueField="Value"
                    LineColor="#008000" LineWidth="4" LineType="dashed" />
            </Series>
        </f:Chart>


    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>通过线型、颜色和粗细配置改变折线外观。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照虚线折线图</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartLineDashed").ClientID %>' title="图表">图表</strong>中的分类、数值和形状。<br />结果：用粗绿色虚线连接五个分类的数据点。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <a href="https://echarts.apache.org/handbook/zh/how-to/chart-types/line/basic-line/#折线的样式" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>LineType</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartLineDashed").ClientID %>' title="图表">图表</strong>）：初始为 <code>dashed</code>，把连线画成虚线，可与线宽和颜色同时设置。</li>
        <li><code>LineWidth</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartLineDashed").ClientID %>' title="图表">图表</strong>）：初始为 <code>4</code>，将线宽设为 4 像素。</li>
        <li><code>LineColor</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartLineDashed").ClientID %>' title="图表">图表</strong>）：初始为 <code>#008000</code>，设置连线的绿色，数据点标记继续使用系列颜色。</li>
    </ul>
</section>
</template>
</body>
</html>
