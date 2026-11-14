<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rose.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieRose" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>南丁格尔玫瑰图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartPieRose" runat="server" Height="550px" DataCategoryField="Category"
            ShowTooltip="false" PieRoseType="area" PieRadius="50%">
            <Series>
                <f:ChartSeries Key="value" Type="Pie" Name="value" DataValueField="Value" />
            </Series>
        </f:Chart>


    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>用相同角度、不同半径的扇区比较数值，形成南丁格尔玫瑰图。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照南丁格尔玫瑰图</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieRose").ClientID %>' title="图表">图表</strong>中的分类、数值和形状。<br />结果：五个扇区角度相同，数值较大的扇区向外伸得更远。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <a href="https://echarts.apache.org/handbook/zh/how-to/chart-types/pie/rose/" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>PieRoseType</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieRose").ClientID %>' title="图表">图表</strong>）：初始为 <code>area</code>，用等角扇区比较半径。若设为 radius，角度也会随数值变化。</li>
        <li><code>PieRadius</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieRose").ClientID %>' title="图表">图表</strong>）：初始为 <code>50%</code>，外半径取容器短边的一半再乘以 50%，和原例的默认半径一致。</li>
    </ul>
</section>
</template>
</body>
</html>
