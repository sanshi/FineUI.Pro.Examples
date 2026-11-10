<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="basic.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineBasic" %>
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
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li>
                    <code>Type="Line"</code>
                    按分类的顺序连接数值，显示一周内的变化。
                </li>
            </ul>
        </section>
    </form>
</body>
</html>
