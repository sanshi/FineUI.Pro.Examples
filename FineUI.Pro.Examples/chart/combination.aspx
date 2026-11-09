<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="combination.aspx.cs" Inherits="FineUI.Pro.Examples.chart.combination" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>折柱混合图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartCombo" runat="server" Height="350px" CategoryField="Category" ShowLegend="true">
            <Series>
                <f:ChartSeries Key="evaporation" Type="Bar" Name="Evaporation" ValueField="Evaporation" />
                <f:ChartSeries Key="precipitation" Type="Bar" Name="Precipitation" ValueField="Precipitation" />
                <f:ChartSeries Key="temperature" Type="Line" Name="Temperature" ValueField="Temperature" />
            </Series>
        </f:Chart>
        <p>月份和三组数值沿用官网的多 Y 轴示例。FineUI 当前把两个柱状系列与折线系列画在同一条数值轴上。<a href="https://echarts.apache.org/examples/zh/editor.html?c=multiple-y-axis" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
    </form>
</body>
</html>
