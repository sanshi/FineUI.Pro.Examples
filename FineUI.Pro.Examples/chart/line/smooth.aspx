<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="smooth.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineSmooth" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>平滑折线图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartLineSmooth" runat="server" Height="550px" CategoryField="Category"
            ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="value" Type="Line" Name="数值" ValueField="Value" Smooth="true" />
            </Series>
        </f:Chart>
        <p>开启平滑后，数据点之间以曲线连接。<a href="https://echarts.apache.org/examples/zh/editor.html?c=line-smooth" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
    </form>
</body>
</html>
