<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="stack_all.aspx.cs" Inherits="FineUI.Pro.Examples.chart.AreaStackAll" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>正负值堆叠面积图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Chart ID="ChartAreaStackAll" runat="server" Height="550px" DataCategoryField="Category"
            ShowTooltip="false">
            <Series>
                <f:ChartSeries Key="baseline" Type="Line" Name="stack" DataValueField="Baseline"
                    Stack="stack" StackStrategy="all" />
                <f:ChartSeries Key="change" Type="Area" Name="stack" DataValueField="Change"
                    Stack="stack" StackStrategy="all" />
            </Series>
        </f:Chart>


    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>按可相抵的正负数值堆叠面积，对照基准折线与累计结果。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照正负值堆叠面积图</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartAreaStackAll").ClientID %>' title="图表">图表</strong>中的分类、数值和形状。<br />结果：面积系列绘制第二组数据叠加到基准折线后的结果，正负值可以相抵。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Stack</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartAreaStackAll").ClientID %>' title="图表">图表</strong>）：初始为 <code>stack</code>，将基准折线和填充面积放入同一个堆叠组，面积系列在基准折线之后声明。</li>
        <li><code>StackStrategy</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartAreaStackAll").ClientID %>' title="图表">图表</strong>）：初始为 <code>all</code>，允许异号值相加。第 4 类的基准值 −1 加上变动值 1，得到 0。默认同号堆叠下，第二个值会从零单独累计。</li>
    </ul>
</section>
</template>
</body>
</html>
