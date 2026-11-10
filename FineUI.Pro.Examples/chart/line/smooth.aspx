<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="smooth.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineSmooth" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>平滑折线图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartLineSmooth" runat="server" Height="550px" DataCategoryField="Category"
            ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="value" Type="Line" Name="数值" DataValueField="Value" Smooth="true" />
            </Series>
        </f:Chart>
        <p>开启平滑后，数据点之间以曲线连接。<a href="https://echarts.apache.org/examples/zh/editor.html?c=line-smooth" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li>
                    <code>Smooth="true"</code>
                    用平滑曲线连接相邻数据点，数据点本身的位置和值保持原样。
                </li>
            </ul>
        </section>
    </form>
</body>
</html>
