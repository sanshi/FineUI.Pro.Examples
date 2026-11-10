<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="step.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineStep" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>阶梯折线图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartLineStep" runat="server" Height="550px" DataCategoryField="Category"
            Title="Step Line" TitleAlign="Left" ShowLegend="true" ShowSaveAsImage="true">
            <Series>
                <f:ChartSeries Key="start" Type="Line" Name="Step Start" DataValueField="AtStart" Step="start" />
                <f:ChartSeries Key="middle" Type="Line" Name="Step Middle" DataValueField="AtMiddle"
                    Step="middle" />
                <f:ChartSeries Key="end" Type="Line" Name="Step End" DataValueField="AtEnd" Step="end" />
            </Series>
        </f:Chart>
        <p>三条系列分别在前一个数据点、两点之间的中点和后一个数据点改变高度。<a href="https://echarts.apache.org/examples/zh/editor.html?c=line-step" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li>
                    <code>Step="start"</code>
                    在前一个数据点的位置改变高度。
                </li>
                <li>
                    <code>Step="middle"</code>
                    在两个相邻数据点的中间改变高度。
                </li>
                <li>
                    <code>Step="end"</code>
                    到后一个数据点的位置才改变高度。
                </li>
            </ul>
        </section>
    </form>
</body>
</html>
