<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="channel_details.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieChannelDetails" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/ChannelVisitData.cs;~/chart/data/ChartDataRows.cs" />
    <title>饼图扇区联动渠道明细表</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" IsFluid="true" Layout="Block" BlockConfigSpace="16" ShowHeader="false" ShowBorder="false">
            <Items>
                <f:Panel runat="server" BlockLG="6" Height="550px" Layout="Fit" Title="访问渠道占比" ShowHeader="true" ShowBorder="true" BodyPadding="8">
                    <Items>
                        <f:Chart runat="server" ID="ChartChannelDetails" DataCategoryField="Category" DataIDField="Id" OnPointClick="ChartChannelDetails_PointClick">
                            <Series>
                                <f:ChartSeries Key="amount" Type="Pie" Name="访问量" DataValueField="Amount" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
                <f:Grid runat="server" ID="GridChannelMonths" BlockLG="6" Title="月度访问明细" ShowHeader="true" ShowBorder="true" Height="550px">
                    <Toolbars>
                        <f:Toolbar runat="server" Position="Top">
                            <Items>
                                <f:Button runat="server" ID="btnClear" Text="清除选择" OnClick="btnClear_Click" CssClass="marginr" />
                                <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Columns>
                        <f:RenderField DataField="Category" HeaderText="月份" ExpandUnusedSpace="true" />
                        <f:RenderField DataField="Amount" HeaderText="访问量" Width="100px" TextAlign="Right" />
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>



    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>点击渠道扇区，明细表显示该渠道六个月的访问量。点击「清除选择」恢复空明细，饼图继续展示全部渠道。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>从扇区查看月度明细</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartChannelDetails").ClientID %>' title="图表">图表</strong>中的一个渠道扇区。<br />结果：后台把该渠道六个月的访问量填入<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("GridChannelMonths").ClientID %>' title="月度访问明细">月度访问明细</strong>。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnClear").ClientID %>' title="清除选择">清除选择</strong>。<br />结果：恢复空明细；饼图继续展示全部渠道。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>DataIDField</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartChannelDetails").ClientID %>' title="图表">图表</strong>）：扇区提交渠道编号，例如 search 表示搜索。</li>
        <li><code>OnPointClick</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartChannelDetails").ClientID %>' title="图表">图表</strong>）：按渠道查询月度记录，刷新 Grid 和当前选择说明。</li>
    </ul>
</section>
</template>
</body>
</html>
