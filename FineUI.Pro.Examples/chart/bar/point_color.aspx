<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="point_color.aspx.cs" Inherits="FineUI.Pro.Examples.chart.BarPointColor" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>单柱配色</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartBarPointColor" runat="server" Height="550px" CategoryField="Category"
            ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="value" Type="Bar" Name="数值" ValueField="Value" ColorField="PointColor" />
            </Series>
        </f:Chart>
        <p>为星期二的数据行指定颜色，其余柱子沿用系列配色。<a href="https://echarts.apache.org/examples/zh/editor.html?c=bar-data-color" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li>
                    <code>ColorField="PointColor"</code>
                    从每行读取颜色。本例只有 Tue 提供 #505372，其他柱子继续使用系列配色。
                </li>
            </ul>
        </section>
    </form>
</body>
</html>
