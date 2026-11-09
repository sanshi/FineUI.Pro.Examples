<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="doughnut.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieDoughnut" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>环形图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartPieDoughnut" runat="server" Height="550px" CategoryField="Category"
            ShowLegend="true" LegendTop="5%" PieRadius="40%,70%"
            PieShowLabel="false" PieLabelPosition="center" PieEmphasisLabelSize="40"
            PieEmphasisLabelFontWeight="bold">
            <Series>
                <f:ChartSeries Key="source" Type="Pie" Name="Access From" ValueField="Value" />
            </Series>
        </f:Chart>
        <p>内半径留出圆心空间，指向扇区可在中央显示分类名称。<a href="https://echarts.apache.org/examples/zh/editor.html?c=pie-doughnut" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
    </form>
</body>
</html>
