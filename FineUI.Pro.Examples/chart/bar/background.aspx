<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="background.aspx.cs" Inherits="FineUI.Pro.Examples.chart.BarBackground" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>带背景色的柱状图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartBarBackground" runat="server" Height="550px" CategoryField="Category"
            ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="value" Type="Bar" Name="数值" ValueField="Value" ShowBackground="true" />
            </Series>
        </f:Chart>
        <p>每根柱子后方显示浅色背景，用来对照柱高。<a href="https://echarts.apache.org/examples/zh/editor.html?c=bar-background" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
    </form>
</body>
</html>
