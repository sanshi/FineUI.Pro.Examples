<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="drill_down.aspx.cs" Inherits="FineUI.Pro.Examples.chart.BarDrillDown" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/RegionSalesData.cs;~/chart/data/ChartDataRows.cs" />
    <title>柱状图钻取与返回</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <f:Panel runat="server" IsFluid="true" Title="区域销售分析" ShowHeader="true" ShowBorder="true" BodyPadding="8">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:Button runat="server" ID="btnBack" Text="返回区域" OnClick="btnBack_Click" Enabled="false" CssClass="marginr" />
                        <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Chart runat="server" ID="ChartRegionSales" Height="550px" DataCategoryField="Category" DataIDField="Id" OnPointClick="ChartRegionSales_PointClick">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Bar" Name="销售额（元）" DataValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>



    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>先查看各区域的销售额，再点击区域柱钻取城市明细。「返回区域」恢复汇总。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>钻取后返回汇总</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartRegionSales").ClientID %>' title="图表">图表</strong>中的区域柱。<br />结果：后台用该区域城市销售额替换汇总柱，<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnBack").ClientID %>' title="返回区域">返回区域</strong>按钮变为可用。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnBack").ClientID %>' title="返回区域">返回区域</strong>。<br />结果：恢复区域汇总，返回按钮恢复不可用。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>DataIDField</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartRegionSales").ClientID %>' title="图表">图表</strong>）：初始为 <code>Id</code>，用区域编号识别被点击的柱，例如 east 表示华东。</li>
        <li><code>OnPointClick</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartRegionSales").ClientID %>' title="图表">图表</strong>）：后台在同一张图表中重绑城市数据；城市是末级，点击后保持当前视图。</li>
    </ul>
</section>
</template>
</body>
</html>
