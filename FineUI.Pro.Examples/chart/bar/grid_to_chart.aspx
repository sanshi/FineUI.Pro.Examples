<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_to_chart.aspx.cs" Inherits="FineUI.Pro.Examples.chart.BarGridToChart" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/RegionSalesData.cs;~/chart/data/ChartDataRows.cs" />
    <title>Grid 选行联动柱状图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <f:Panel runat="server" Layout="Block" BlockConfigSpace="16" IsFluid="true" ShowHeader="false" ShowBorder="false">
            <Items>
                <f:Grid runat="server" ID="GridRegions" BlockLG="4" Title="区域" ShowHeader="true" ShowBorder="true" Height="550px"
                    DataIDField="Id" EnableRowClickEvent="true" OnRowClick="GridRegions_RowClick">
                    <Columns>
                        <f:RenderField DataField="Category" HeaderText="区域" ExpandUnusedSpace="true" />
                        <f:RenderField DataField="Amount" HeaderText="累计销售额" Width="108px" TextAlign="Right" />
                    </Columns>
                </f:Grid>
                <f:Panel runat="server" BlockLG="8" Height="550px" Layout="Fit" Title="月度销售额（元）" ShowHeader="true" ShowBorder="true" BodyPadding="8">
                    <Toolbars>
                        <f:Toolbar runat="server" Position="Top">
                            <Items>
                                <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:Chart runat="server" ID="ChartRegionMonths" DataCategoryField="Category">
                            <Series>
                                <f:ChartSeries Key="amount" Type="Bar" Name="销售额（元）" DataValueField="Amount" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>



    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>点击区域表格的一行，右侧柱状图显示该区域 4 至 9 月的销售额。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>从表格选择区域</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("GridRegions").ClientID %>' title="区域">区域</strong>点击另一条区域记录。<br />结果：后台按区域重新绑定<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartRegionMonths").ClientID %>' title="图表">图表</strong>，显示该区域 4 至 9 月销售额，范围文字同步更新。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>DataIDField</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("GridRegions").ClientID %>' title="区域">区域</strong>）：初始为 <code>Id</code>，Grid 使用区域业务键识别当前行，例如 east 对应华东。</li>
        <li><code>EnableRowClickEvent / OnRowClick</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("GridRegions").ClientID %>' title="区域">区域</strong>）：初始为 <code>true</code>，启用 ，后台通过行的业务键查询该区域的月度销售额，并更新柱状图。</li>
    </ul>
</section>
</template>
</body>
</html>
