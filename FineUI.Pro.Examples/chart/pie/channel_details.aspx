<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="channel_details.aspx.cs" Inherits="FineUI.Pro.Examples.chart.PieChannelDetails" %>
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

        <p>点击渠道扇区，明细表显示该渠道六个月的访问量。点击「清除选择」恢复空明细，饼图继续展示全部渠道。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li><code>DataIDField</code> 扇区提交渠道编号，例如 search 表示搜索。</li>
                <li><code>OnPointClick</code> 按渠道查询月度记录，刷新 Grid 和当前选择说明。</li>
            </ul>
        </section>
    </form>
</body>
</html>
