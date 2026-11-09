<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="bar.aspx.cs" Inherits="FineUI.Pro.Examples.chart.bar" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>基础柱状图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartBar" runat="server" Height="350px" CategoryField="Category" ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="value" Type="Bar" Name="数值" ValueField="Value" />
            </Series>
        </f:Chart>
        <p>柱高表示各分类的数值，分类和数值沿用官网示例。<a href="https://echarts.apache.org/examples/zh/editor.html?c=bar-simple" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
    </form>
</body>
</html>
