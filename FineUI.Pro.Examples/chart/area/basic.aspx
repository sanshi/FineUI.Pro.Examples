<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basic.aspx.cs" Inherits="FineUI.Pro.Examples.chart.AreaBasic" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>基础面积图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartArea" runat="server" Height="550px" DataCategoryField="Category" ShowTooltip="false" CategoryBoundaryGap="false">
            <Series>
                <f:ChartSeries Key="value" Type="Area" Name="数值" DataValueField="Value" />
            </Series>
        </f:Chart>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用面积填充折线下方区域，并让分类轴首尾不留空隙。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照基础面积图</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartArea").ClientID %>'
                        title="图表">图表</strong>中的分类、数值和形状。<br />结果：面积图填充折线下方区域，分类和数值沿用官网示例。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <a href="https://echarts.apache.org/examples/zh/editor.html?c=area-basic" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Type</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartArea").ClientID %>' title="图表">图表</strong>）：初始为
                    <code>Area</code>，在折线下方填充区域。
                </li>
                <li><code>CategoryBoundaryGap</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartArea").ClientID %>' title="图表">图表</strong>）：初始为
                    <code>false</code>，首尾分类贴到绘图区边缘，使面积填充延伸到两侧。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
