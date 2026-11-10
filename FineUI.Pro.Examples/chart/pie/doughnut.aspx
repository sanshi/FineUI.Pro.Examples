<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="doughnut.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieDoughnut" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>环形图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartPieDoughnut" runat="server" Height="550px" DataCategoryField="Category"
            ShowLegend="true" LegendTop="5%" PieRadius="40%,70%"
            PieShowLabel="false" PieLabelPosition="center" PieEmphasisLabelSize="40"
            PieEmphasisLabelFontWeight="bold">
            <Series>
                <f:ChartSeries Key="source" Type="Pie" Name="Access From" DataValueField="Value" />
            </Series>
        </f:Chart>
        <p>内半径留出圆心空间，指向扇区可在中央显示分类名称。<a href="https://echarts.apache.org/examples/zh/editor.html?c=pie-doughnut" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li>
                    <code>PieRadius="40%,70%"</code>
                    同时指定内外半径，圆心处留空形成环形。
                </li>
                <li>
                    <code>LegendTop="5%"</code>
                    图例从距离图表顶部 5% 的位置开始显示。
                </li>
                <li>
                    <code>PieShowLabel="false"</code>、<code>PieLabelPosition="center"</code>
                    平时隐藏扇区标签和引导线，标签位置设在环形中央。
                </li>
                <li>
                    <code>PieEmphasisLabelSize="40"</code>、<code>PieEmphasisLabelFontWeight="bold"</code>
                    指向扇区时，以 40 像素粗体在中央显示该扇区的名称。
                </li>
            </ul>
        </section>
    </form>
</body>
</html>
