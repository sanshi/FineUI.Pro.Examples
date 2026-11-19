<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="basic.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineBasic" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>基础折线图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartLine" runat="server" Height="550px" DataCategoryField="Category" ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="value" Type="Line" Name="数值" DataValueField="Value" />
            </Series>
        </f:Chart>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按分类顺序连接数据点，用折线显示数值变化。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照基础折线图</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartLine").ClientID %>'
                        title="图表">图表</strong>中的分类、数值和形状。<br />结果：折线连接一周的七个数据点，分类和数值沿用官网示例。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <a href="https://echarts.apache.org/examples/zh/editor.html?c=line-simple" target="_blank" rel="noopener">查看 Apache ECharts 原始示例</a>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Type</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartLine").ClientID %>' title="图表">图表</strong>）：初始为
                    <code>Line</code>，按分类的顺序连接数值，显示一周内的变化。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
