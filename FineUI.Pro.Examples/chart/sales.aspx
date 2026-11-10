<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="sales.aspx.cs" Inherits="FineUI.Pro.Examples.chart.sales" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>图表绑定与 Grid 联动</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" Layout="Block" BlockConfigSpace="16" IsFluid="true" ShowHeader="false" ShowBorder="false">
            <Items>
                <f:Panel runat="server" BlockLG="7" ShowHeader="true" ShowBorder="true" Title="月度销售额（元）" BodyPadding="8px">
                    <Toolbars>
                        <f:Toolbar runat="server" Position="Top">
                            <Items>
                                <f:Button ID="btnRecent" runat="server" Text="最近两个月" CssClass="marginr" OnClick="btnRecent_Click" />
                                <f:Button ID="btnReset" runat="server" Text="显示全部" OnClick="btnReset_Click" />
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Items>
                        <f:Chart ID="ChartSales" runat="server" Height="286px" CategoryField="Category"
                            DataKeyField="Month" OnPointClick="ChartSales_PointClick">
                            <Series>
                                <f:ChartSeries Key="sales" Type="Bar" Name="销售额" ValueField="Amount" />
                            </Series>
                        </f:Chart>
                    </Items>
                </f:Panel>
                <f:Grid ID="GridOrders" runat="server" BlockLG="5" Height="386px" Title="订单明细" ShowHeader="true" ShowBorder="true">
                    <Toolbars>
                        <f:Toolbar runat="server" Position="Top">
                            <Items>
                                <f:ToolbarText ID="ToolbarTextOrderScope" runat="server" />
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                    <Columns>
                        <f:RenderField ColumnID="Number" DataField="Number" HeaderText="订单号" Width="80" />
                        <f:RenderField ColumnID="Customer" DataField="Customer" HeaderText="客户" Width="78" ExpandUnusedSpace="true" />
                        <f:RenderField ColumnID="Month" DataField="Month" HeaderText="月份" Width="80" />
                        <f:RenderField ColumnID="Amount" DataField="Amount" HeaderText="金额" Width="84" TextAlign="Right" />
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>
        <p>点击月份柱可查看当月订单。「最近两个月」同时缩小图表和明细的范围，「显示全部」恢复六个月。页面使用演示订单数据。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li>
                    <code>DataKeyField="Month"</code>
                    点击月份柱时传递业务键，例如 2026-09。横轴上的「9 月」只用于显示。
                </li>
                <li>
                    <code>OnPointClick="ChartSales_PointClick"</code>
                    将点击交给后台处理，用月份业务键筛选订单并更新 Grid。
                </li>
            </ul>
        </section>
    </form>
</body>
</html>
