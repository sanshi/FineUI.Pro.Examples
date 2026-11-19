<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pad_angle.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PiePadAngle" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>饼图扇区间隙</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartPiePadAngle" runat="server" Height="550px" DataCategoryField="Category" ShowLegend="true" LegendTop="5%" PieRadius="40%,70%"
            PieAvoidLabelOverlap="false" PiePadAngle="5" PieBorderRadius="10" PieShowLabel="false" PieLabelPosition="center" PieEmphasisLabelSize="40"
            PieEmphasisLabelFontWeight="bold">
            <Series>
                <f:ChartSeries Key="source" Type="Pie" Name="Access From" DataValueField="Value" />
            </Series>
        </f:Chart>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在相邻扇区间保留角度间隙，并设置扇区圆角。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照饼图扇区间隙</h3>
            <ul>
                <li>将鼠标移到<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPiePadAngle").ClientID %>'
                        title="图表">图表</strong>中的一个扇区。<br />结果：中央显示该分类名称，同时可对照本页内外半径、圆角或扇区间距。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <a href="https://echarts.apache.org/examples/zh/editor.html?c=pie-padAngle" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PiePadAngle</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPiePadAngle").ClientID %>' title="图表">图表</strong>）：初始为
                    <code>5</code>，在相邻扇区之间留出 5° 的角度间隙。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
