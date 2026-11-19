<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basic.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieBasic" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>基础饼图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartPie" runat="server" Height="550px" DataCategoryField="Category" Title="Referer of a Website" Subtitle="Fake Data" TitleAlign="Center"
            ShowLegend="true" LegendPosition="Left" PieEmphasisShadow="true" PieRadius="50%" Palette="#5070dd,#b6d634,#505372,#ff994d,#0ca8df">
            <Series>
                <f:ChartSeries Key="value" Type="Pie" Name="Access From" DataValueField="Value" />
            </Series>
        </f:Chart>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把各访问来源的数值映射为饼图扇区，比较各部分占比。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照基础饼图</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPie").ClientID %>'
                        title="Referer of a Website">Referer of a Website</strong>中的分类、数值和形状。<br />结果：扇区表示各访问来源所占比例，来源和访问量沿用官网示例。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <a href="https://echarts.apache.org/examples/zh/editor.html?c=pie-simple" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Type / PieRadius</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPie").ClientID %>' title="Referer of a Website">Referer of a
                        Website</strong>）：初始分别为 <code>Pie</code>、<code>50%</code>，每块扇区的角度表示该来源的占比。半径取图表短边一半的 50%。</li>
                <li><code>ShowLegend / LegendPosition</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPie").ClientID %>' title="Referer of a Website">Referer of a
                        Website</strong>）：初始分别为 <code>true</code>、<code>Left</code>，启用左侧竖排图例。未设置图例的纵向位置，当前布局由 ECharts 放在左下方。</li>
                <li><code>PieEmphasisShadow</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPie").ClientID %>' title="Referer of a Website">Referer of a
                        Website</strong>）：初始为 <code>true</code>，指向某块扇区时显示阴影。</li>
            </ul>
        </section>
    </template>
</body>
</html>
