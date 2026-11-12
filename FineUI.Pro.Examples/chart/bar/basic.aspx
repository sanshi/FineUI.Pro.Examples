<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="basic.aspx.cs" Inherits="FineUI.Pro.Examples.chart.BarBasic" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>基础柱状图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartBar" runat="server" Height="550px" DataCategoryField="Category" ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="value" Type="Bar" Name="数值" DataValueField="Value" />
            </Series>
        </f:Chart>


    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>把分类和数值绑定为柱状图，以柱高比较各分类大小。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照基础柱状图</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartBar").ClientID %>' title="图表">图表</strong>中的分类、数值和形状。<br />结果：柱高表示各分类的数值，分类和数值沿用官网示例。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <a href="https://echarts.apache.org/examples/zh/editor.html?c=bar-simple" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>DataCategoryField</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartBar").ClientID %>' title="图表">图表</strong>）：初始为 <code>Category</code>，从每行的 Category 字段读取横轴分类，例如 Mon。</li>
        <li><code>Type / DataValueField</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartBar").ClientID %>' title="图表">图表</strong>）：初始分别为 <code>Bar</code>、<code>Value</code>，柱状系列用数值字段决定每根柱子的高度。</li>
    </ul>
</section>
</template>
</body>
</html>
