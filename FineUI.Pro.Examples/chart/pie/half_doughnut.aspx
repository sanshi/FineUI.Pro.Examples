<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="half_doughnut.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieHalfDoughnut" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>半环形图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartPieHalfDoughnut" runat="server" Height="550px" CategoryField="Category"
            ShowLegend="true" LegendTop="5%" PieRadius="40%,70%"
            PieCenter="50%,70%" PieStartAngle="180" PieEndAngle="360">
            <Series>
                <f:ChartSeries Key="source" Type="Pie" Name="Access From" ValueField="Value" />
            </Series>
        </f:Chart>
        <p>将起止角度设为 180° 和 360°，在上半圆绘制各分类。<a href="https://echarts.apache.org/examples/zh/editor.html?c=pie-half-donut" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
    </form>
</body>
</html>
