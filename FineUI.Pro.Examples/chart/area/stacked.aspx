<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="stacked.aspx.cs" Inherits="FineUI.Pro.Examples.chart.AreaStacked" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>堆叠面积图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartAreaStacked" runat="server" Height="550px" CategoryField="Category"
            Title="Stacked Area Chart" TitleAlign="Left" ShowLegend="true"
            CategoryBoundaryGap="false" AxisPointerType="cross" AxisPointerLabelColor="#6a7985"
            ShowSaveAsImage="true">
            <Series>
                <f:ChartSeries Key="email" Type="Area" Name="Email" ValueField="Email" Stack="Total" FocusSeries="true" />
                <f:ChartSeries Key="unionAds" Type="Area" Name="Union Ads" ValueField="UnionAds" Stack="Total" FocusSeries="true" />
                <f:ChartSeries Key="videoAds" Type="Area" Name="Video Ads" ValueField="VideoAds" Stack="Total" FocusSeries="true" />
                <f:ChartSeries Key="direct" Type="Area" Name="Direct" ValueField="Direct" Stack="Total" FocusSeries="true" />
                <f:ChartSeries Key="searchEngine" Type="Area" Name="Search Engine" ValueField="SearchEngine"
                    Stack="Total" FocusSeries="true" ShowLabel="true" />
            </Series>
        </f:Chart>
        <p>同组系列沿纵轴累计。指向数据点可查看对应分类，右上角按钮可保存图表。<a href="https://echarts.apache.org/examples/zh/editor.html?c=area-stack" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
    </form>
</body>
</html>
