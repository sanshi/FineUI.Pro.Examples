<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="stacked.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineStacked" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>堆叠折线图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartLineStacked" runat="server" Height="550px" CategoryField="Category"
            Title="Stacked Line" TitleAlign="Left" ShowLegend="true" CategoryBoundaryGap="false"
            ShowSaveAsImage="true">
            <Series>
                <f:ChartSeries Key="email" Type="Line" Name="Email" ValueField="Email" Stack="Total" />
                <f:ChartSeries Key="unionAds" Type="Line" Name="Union Ads" ValueField="UnionAds" Stack="Total" />
                <f:ChartSeries Key="videoAds" Type="Line" Name="Video Ads" ValueField="VideoAds" Stack="Total" />
                <f:ChartSeries Key="direct" Type="Line" Name="Direct" ValueField="Direct" Stack="Total" />
                <f:ChartSeries Key="searchEngine" Type="Line" Name="Search Engine" ValueField="SearchEngine"
                    Stack="Total" />
            </Series>
        </f:Chart>
        <p>同组折线按分类累计。悬停可查看各来源的原始值，右上角可保存图片。<a href="https://echarts.apache.org/examples/zh/editor.html?c=line-stack" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li>
                    <code>Stack="Total"</code>
                    同组折线按天累计，悬停提示仍显示各系列的原始值。
                </li>
                <li>
                    <code>ShowSaveAsImage="true"</code>
                    在图表右上角显示保存图片按钮。
                </li>
            </ul>
        </section>
    </form>
</body>
</html>
