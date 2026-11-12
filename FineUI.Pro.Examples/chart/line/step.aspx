<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="step.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineStep" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>阶梯折线图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartLineStep" runat="server" Height="550px" DataCategoryField="Category"
            Title="Step Line" TitleAlign="Left" ShowLegend="true" ShowSaveAsImage="true">
            <Series>
                <f:ChartSeries Key="start" Type="Line" Name="Step Start" DataValueField="AtStart" Step="start" />
                <f:ChartSeries Key="middle" Type="Line" Name="Step Middle" DataValueField="AtMiddle"
                    Step="middle" />
                <f:ChartSeries Key="end" Type="Line" Name="Step End" DataValueField="AtEnd" Step="end" />
            </Series>
        </f:Chart>


    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>并列对照阶梯线在起点、中点和终点改变高度的差异。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照阶梯折线图</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartLineStep").ClientID %>' title="Step Line">Step Line</strong>中的分类、数值和形状。<br />结果：三条系列分别在前一个数据点、两点之间的中点和后一个数据点改变高度。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <a href="https://echarts.apache.org/examples/zh/editor.html?c=line-step" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Step</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartLineStep").ClientID %>' title="Step Line">Step Line</strong>）：初始为 <code>start</code>，在前一个数据点的位置改变高度。</li>
    </ul>
</section>
</template>
</body>
</html>
