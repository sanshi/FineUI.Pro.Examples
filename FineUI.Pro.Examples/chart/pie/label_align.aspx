<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="label_align.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieLabelAlign" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>饼图标签对齐</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <h2 style="text-align: center; font-size: 18px; margin: 0;">Pie label alignTo</h2>
        <f:Panel runat="server" Layout="Block" BlockConfigSpace="0" IsFluid="true" ShowHeader="false" ShowBorder="false">
            <Items>
                <f:Panel runat="server" BlockLG="4" Height="550px" Layout="Fit" ShowHeader="false" ShowBorder="false">
                    <Items>
                        <f:Chart runat="server" ID="ChartPieLabelAlignNone" DataCategoryField="Category" ShowTooltip="false" PieRadius="25%" TitleTop="75%"
                            Subtitle="alignTo: &quot;none&quot; (default)" PieLabelAlignTo="none" PieLabelBleedMargin="5">
                            <Series>
                                <f:ChartSeries Key="fruit" Type="Pie" DataValueField="Value" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" BlockLG="4" Height="550px" Layout="Fit" ShowHeader="false" ShowBorder="false">
                    <Items>
                        <f:Chart runat="server" ID="ChartPieLabelAlignLine" DataCategoryField="Category" ShowTooltip="false" PieRadius="25%" TitleTop="75%"
                            Subtitle="alignTo: &quot;labelLine&quot;" PieLabelAlignTo="labelLine" PieLabelBleedMargin="5">
                            <Series>
                                <f:ChartSeries Key="fruit" Type="Pie" DataValueField="Value" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" BlockLG="4" Height="550px" Layout="Fit" ShowHeader="false" ShowBorder="false">
                    <Items>
                        <f:Chart runat="server" ID="ChartPieLabelAlignEdge" DataCategoryField="Category" ShowTooltip="false" PieRadius="25%" TitleTop="75%"
                            Subtitle="alignTo: &quot;edge&quot;" PieLabelAlignTo="edge" PieLabelEdgeDistance="20">
                            <Series>
                                <f:ChartSeries Key="fruit" Type="Pie" DataValueField="Value" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>



    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>用相同数据对照饼图外侧标签的三种对齐方式。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照饼图标签对齐</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieLabelAlignNone").ClientID %>' title="第 1 个图表">第 1 个图表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieLabelAlignLine").ClientID %>' title="第 2 个图表">第 2 个图表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieLabelAlignEdge").ClientID %>' title="第 3 个图表">第 3 个图表</strong>中的分类、数值和形状。<br />结果：三张饼图使用相同的水果数据，用于对照外侧标签的三种对齐方式。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <a href="https://echarts.apache.org/examples/zh/editor.html?c=pie-alignTo" target="_blank" rel="noopener">查看 Apache
                ECharts 原始示例</a>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>PieLabelAlignTo</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieLabelAlignNone").ClientID %>' title="第 1 个图表">第 1 个图表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieLabelAlignLine").ClientID %>' title="第 2 个图表">第 2 个图表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieLabelAlignEdge").ClientID %>' title="第 3 个图表">第 3 个图表</strong>）：none 让标签跟随引导线，labelLine 对齐引导线端点，edge 将标签对齐绘图区的边缘。</li>
        <li><code>PieLabelBleedMargin / PieLabelEdgeDistance</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieLabelAlignNone").ClientID %>' title="第 1 个图表">第 1 个图表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieLabelAlignLine").ClientID %>' title="第 2 个图表">第 2 个图表</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartPieLabelAlignEdge").ClientID %>' title="第 3 个图表">第 3 个图表</strong>）：前两种模式保留 5 像素边界间距，edge 模式让标签距绘图区边缘 20 像素。</li>
    </ul>
</section>
</template>
</body>
</html>
