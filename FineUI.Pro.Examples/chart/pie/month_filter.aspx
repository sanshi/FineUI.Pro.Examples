<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="month_filter.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieMonthFilter" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/ChannelVisitData.cs;~/chart/data/ChartDataRows.cs" />
    <title>下拉筛选饼图月份</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" IsFluid="true" Title="访问渠道构成" ShowHeader="true" ShowBorder="true" BodyPadding="8">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:SimpleForm runat="server" IsFluid="true" MaxWidth="240px" ShowHeader="false" ShowBorder="false" LabelWidth="64">
                    <Items>
                        <f:DropDownList runat="server" ID="ddlMonth" Label="月份" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                            <f:ListItem Text="全部月份" Value="all" Selected="true" />
                            <f:ListItem Text="4 月" Value="2026-04" />
                            <f:ListItem Text="5 月" Value="2026-05" />
                            <f:ListItem Text="6 月" Value="2026-06" />
                            <f:ListItem Text="7 月" Value="2026-07" />
                            <f:ListItem Text="8 月" Value="2026-08" />
                            <f:ListItem Text="9 月" Value="2026-09" />
                        </f:DropDownList>
                    </Items>
                </f:SimpleForm>
                <f:Chart runat="server" ID="ChartChannelMonth" Height="550px" DataCategoryField="Category">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Pie" Name="访问量" DataValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>



    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>从下拉列表选择一个月份，饼图显示当月各渠道占比。选择「全部月份」可恢复六个月汇总。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>按月份查看占比</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlMonth").ClientID %>' title="全部月份">全部月份</strong>选择一个月份。<br />结果：后台更新该月各渠道访问量和占比。</li>
        <li>重新选择<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlMonth").ClientID %>' title="全部月份">全部月份</strong>。<br />结果：恢复六个月合计的渠道分布。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Items</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlMonth").ClientID %>' title="全部月份">全部月份</strong>）：下拉项使用完整月份键，全部月份使用 all。</li>
        <li><code>OnSelectedIndexChanged</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlMonth").ClientID %>' title="全部月份">全部月份</strong>）：后台使用同一批数据计算扇区和总访问量。</li>
    </ul>
</section>
</template>
</body>
</html>
