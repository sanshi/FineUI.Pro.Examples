<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="area.aspx.cs" Inherits="FineUI.Pro.Examples.chart.area" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>基础面积图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartArea" runat="server" Height="550px" CategoryField="Category" ShowTooltip="false" CategoryBoundaryGap="false">
            <Series>
                <f:ChartSeries Key="value" Type="Area" Name="数值" ValueField="Value" />
            </Series>
        </f:Chart>
        <p>面积图填充折线下方区域，分类和数值沿用官网示例。<a href="https://echarts.apache.org/examples/zh/editor.html?c=area-basic" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
    </form>
</body>
</html>
