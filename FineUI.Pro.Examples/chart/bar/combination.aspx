<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="combination.aspx.cs" Inherits="FineUI.Pro.Examples.chart.Combination" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>多 Y 轴示例</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartCombo" runat="server" Height="550px" CategoryField="Category" ShowLegend="true" AxisTickAlignWithLabel="true" AxisPointerType="cross"
            ShowSaveAsImage="true" Palette="#5070dd,#b6d634,#505372">
            <YAxis>
                <f:ChartValueAxis Name="Evaporation" Position="right"
                    AlignTicks="true" LineColor="#5070dd" LabelFormatter="{value} ml" />
                <f:ChartValueAxis Name="Precipitation" Position="right" Offset="80"
                    AlignTicks="true" LineColor="#b6d634" LabelFormatter="{value} ml" />
                <f:ChartValueAxis Name="温度" Position="left"
                    AlignTicks="true" LineColor="#505372" LabelFormatter="{value} °C" />
            </YAxis>
            <Series>
                <f:ChartSeries Key="evaporation" Type="Bar" Name="Evaporation" ValueField="Evaporation" />
                <f:ChartSeries Key="precipitation" Type="Bar" Name="Precipitation" ValueField="Precipitation" YAxisIndex="1" />
                <f:ChartSeries Key="temperature" Type="Line" Name="Temperature" ValueField="Temperature" YAxisIndex="2" />
            </Series>
        </f:Chart>
        <p>蒸发量、降水量和温度使用三条独立数值轴。两条右轴分别显示毫升，左轴显示摄氏度。<a href="https://echarts.apache.org/examples/zh/editor.html?c=multiple-y-axis" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li>
                    <code>&lt;YAxis&gt;</code>、<code>YAxisIndex="1"</code>、<code>YAxisIndex="2"</code>
                    按声明顺序从 0 编号。蒸发量使用第 0 轴，降水量和温度分别使用第 1、2 轴。
                </li>
                <li>
                    <code>Position="right"</code>、<code>Offset="80"</code>
                    将降水量轴放在右侧，并向外移 80 像素，与右侧的蒸发量轴分开。
                </li>
                <li>
                    <code>AlignTicks="true"</code>
                    数值范围不同的轴仍对齐刻度线，便于横向对照。
                </li>
                <li>
                    <code>LabelFormatter="{value} °C"</code>
                    在温度轴的刻度值后显示 °C。两条水量轴使用 ml。
                </li>
            </ul>
        </section>
    </form>
</body>
</html>
