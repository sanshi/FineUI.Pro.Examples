<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="object_array.aspx.cs" Inherits="FineUI.Pro.Examples.chart.BarObjectArray" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>对象数组的输入格式</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <f:Chart runat="server" ID="ChartBarObjectArray" Height="550px" DataCategoryField="Category" ShowLegend="true">
            <Series>
                <f:ChartSeries Key="year2015" Type="Bar" Name="2015" DataValueField="Year2015" />
                <f:ChartSeries Key="year2016" Type="Bar" Name="2016" DataValueField="Year2016" />
                <f:ChartSeries Key="year2017" Type="Bar" Name="2017" DataValueField="Year2017" />
            </Series>
        </f:Chart>



    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>把同一对象数组的多个数值字段分别绑定为年份系列。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照对象数组的输入格式</h3>
    <ul>
        <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartBarObjectArray").ClientID %>' title="图表">图表</strong>中的分类、数值和形状。<br />结果：四种商品沿分类轴排列，每种商品并列显示 2015、2016、2017 三年的数值。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <a href="https://echarts.apache.org/examples/zh/editor.html?c=dataset-simple1" target="_blank"
                rel="noopener">查看 Apache ECharts 原始示例</a>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>DataValueField</code>（<strong>图表系列</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartBarObjectArray").ClientID %>' title="图表">图表</strong>）：一个系列对应一个年份字段，例如 Year2015。三个系列从同一行读取同一种商品的数值。</li>
    </ul>
</section>
</template>
</body>
</html>
