<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="mix_line_bar.aspx.cs" Inherits="FineUI.Pro.Examples.chart.BarMixLineBar" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>折柱混合</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartBarMixLineBar" runat="server" Height="550px" CategoryField="Category"
            ShowLegend="true" AxisPointerType="cross" ShowSaveAsImage="true">
            <YAxes>
                <f:ChartValueAxis Name="Precipitation" Position="left" Min="0" Max="250" Interval="50" LabelFormatter="{value} ml" />
                <f:ChartValueAxis Name="Temperature" Position="right" Min="0" Max="25" Interval="5" LabelFormatter="{value} °C" />
            </YAxes>
            <Series>
                <f:ChartSeries Key="evaporation" Type="Bar" Name="Evaporation" ValueField="Evaporation" />
                <f:ChartSeries Key="precipitation" Type="Bar" Name="Precipitation" ValueField="Precipitation" />
                <f:ChartSeries Key="temperature" Type="Line" Name="Temperature" ValueField="Temperature" YAxisIndex="1" />
            </Series>
        </f:Chart>
        <p>蒸发量和降水量共用左侧毫升轴，温度折线读取右侧摄氏度轴。<a href="https://echarts.apache.org/examples/zh/editor.html?c=mix-line-bar" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
    </form>
</body>
</html>
