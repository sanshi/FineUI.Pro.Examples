<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="trend_link.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieTrendLink" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/ChannelVisitData.cs;~/chart/data/ChartDataRows.cs" />
    <title>饼图联动趋势图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <f:Panel runat="server" Layout="Block" BlockConfigSpace="16" IsFluid="true" ShowHeader="false" ShowBorder="false">
            <Items>
                <f:Panel runat="server" BlockLG="5" Height="550px" Layout="Fit" Title="渠道访问占比" ShowHeader="true" ShowBorder="true" BodyPadding="8">
                    <Items>
                        <f:Chart runat="server" ID="ChartChannels" DataCategoryField="Category" DataIDField="Id" OnPointClick="ChartChannels_PointClick">
                            <Series>
                                <f:ChartSeries Key="amount" Type="Pie" Name="访问量" DataValueField="Amount" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
                <f:Panel ID="PanelExample3" ClientIDMode="Static" runat="server" BlockLG="7" Height="550px" Layout="Fit" Title="月度访问趋势" ShowHeader="true" ShowBorder="true" BodyPadding="8">
                    <Toolbars>
                        <f:Toolbar runat="server" Position="Top">
                            <Items>
                                <f:Button runat="server" ID="btnAllChannels" Text="查看全部渠道" OnClick="btnAllChannels_Click" CssClass="marginr" />
                                <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:Chart runat="server" ID="ChartChannelTrend" DataCategoryField="Category">
                            <Series>
                                <f:ChartSeries Key="amount" Type="Line" Name="访问量" DataValueField="Amount" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>



    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>饼图显示各渠道的访问占比。点击扇区，右侧折线显示该渠道的月度趋势。「查看全部渠道」恢复总趋势。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>按渠道联动趋势</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartChannels").ClientID %>' title="第 1 个图表">第 1 个图表</strong>中的一个渠道扇区。<br />结果：后台把右侧折线切换为该渠道的月度访问趋势。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnAllChannels").ClientID %>' title="查看全部渠道">查看全部渠道</strong>。<br />结果：恢复全部渠道合计的趋势和范围文字。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>DataIDField</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartChannels").ClientID %>' title="第 1 个图表">第 1 个图表</strong>）：初始为 <code>Id</code>，扇区的业务键是渠道编号，例如 search 表示搜索。</li>
        <li><code>OnPointClick</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartChannels").ClientID %>' title="第 1 个图表">第 1 个图表</strong>）：后台按渠道刷新趋势图。饼图继续展示全部渠道，以便换选。</li>
    </ul>
</section>
</template>
</body>
</html>
