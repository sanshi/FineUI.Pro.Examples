<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="fill_color.aspx.cs" Inherits="FineUI.Pro.Examples.chart.AreaFillColor" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>双色填充面积图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartAreaFillColor" runat="server" Height="550px" CategoryField="Category"
            ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="first" Type="Area" Name="系列一" ValueField="First" />
                <f:ChartSeries Key="second" Type="Area" Name="系列二" ValueField="Second" AreaColor="#ff0"
                    AreaOpacity="0.5" />
            </Series>
        </f:Chart>
        <p>第一条系列沿用默认填充，第二条使用 50% 不透明度的黄色。两条折线各自沿用系列配色。<a href="https://echarts.apache.org/handbook/zh/how-to/chart-types/line/area-line/" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li>
                    <code>AreaColor="#ff0"</code>、<code>AreaOpacity="0.5"</code>
                    第二条系列使用 50% 不透明度的黄色填充，折线颜色仍取系列配色。第一条系列保留默认填充。
                </li>
            </ul>
        </section>
    </form>
</body>
</html>
