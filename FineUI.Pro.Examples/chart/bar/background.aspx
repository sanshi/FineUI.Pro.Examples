<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="background.aspx.cs" Inherits="FineUI.Pro.Examples.chart.BarBackground" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>带背景色的柱状图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartBarBackground" runat="server" Height="550px" DataCategoryField="Category"
            ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="value" Type="Bar" Name="数值" DataValueField="Value" ShowBackground="true" />
            </Series>
        </f:Chart>


    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>在柱子后方绘制背景，便于对照同一坐标范围内的柱高。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照带背景色的柱状图</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartBarBackground").ClientID %>' title="图表">图表</strong>中的分类、数值和形状。<br />结果：每根柱子后方显示浅色背景，用来对照柱高。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <a href="https://echarts.apache.org/examples/zh/editor.html?c=bar-background" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>ShowBackground</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartBarBackground").ClientID %>' title="图表">图表</strong>）：初始为 <code>true</code>，在每根柱后绘制浅色背景，便于对照同一坐标轴上的柱高。</li>
    </ul>
</section>
</template>
</body>
</html>
