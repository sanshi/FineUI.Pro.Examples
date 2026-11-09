<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="line.aspx.cs" Inherits="FineUI.Pro.Examples.chart.line" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>基础折线图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartLine" runat="server" Height="550px" CategoryField="Category" ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="value" Type="Line" Name="数值" ValueField="Value" />
            </Series>
        </f:Chart>
        <p>折线连接一周的七个数据点，分类和数值沿用官网示例。<a href="https://echarts.apache.org/examples/zh/editor.html?c=line-simple" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
    </form>
</body>
</html>
