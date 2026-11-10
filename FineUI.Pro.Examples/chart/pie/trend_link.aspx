<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="trend_link.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieTrendLink" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/ChartInteractionData.cs" />
    <title>饼图联动趋势图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <f:Panel runat="server" Layout="Block" BlockConfigSpace="16" IsFluid="true" ShowHeader="false" ShowBorder="false">
            <Items>
                <f:Panel runat="server" BlockLG="5" Height="550px" Layout="Fit" Title="渠道访问占比" ShowHeader="true" ShowBorder="true" BodyPadding="8">
                    <Items>
                        <f:Chart runat="server" ID="ChartChannels" CategoryField="Category" DataKeyField="Key" OnPointClick="ChartChannels_PointClick">
                            <Series>
                                <f:ChartSeries Key="amount" Type="Pie" Name="访问量" ValueField="Amount" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" BlockLG="7" Height="550px" Layout="Fit" Title="月度访问趋势" ShowHeader="true" ShowBorder="true" BodyPadding="8">
                    <Toolbars>
                        <f:Toolbar runat="server" Position="Top">
                            <Items>
                                <f:Button runat="server" ID="btnAllChannels" Text="查看全部渠道" OnClick="btnAllChannels_Click" CssClass="marginr" />
                                <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:Chart runat="server" ID="ChartChannelTrend" CategoryField="Category">
                            <Series>
                                <f:ChartSeries Key="amount" Type="Line" Name="访问量" ValueField="Amount" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

        <p>饼图显示各渠道的访问占比。点击扇区，右侧折线显示该渠道的月度趋势。「查看全部渠道」恢复总趋势。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li><code>DataKeyField="Key"</code> 扇区的业务键是渠道编号，例如 search 表示搜索。</li>
                <li><code>OnPointClick</code> 后台按渠道刷新趋势图。饼图继续展示全部渠道，以便换选。</li>
            </ul>
        </section>
    </form>
</body>
</html>
