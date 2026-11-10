<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="sales_threshold.aspx.cs" Inherits="FineUI.Pro.Examples.chart.BarSalesThreshold" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/ChartInteractionData.cs" />
    <title>金额门槛筛选柱状图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" IsFluid="true" Title="区域销售额" ShowHeader="true" ShowBorder="true" BodyPadding="8">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:SimpleForm runat="server" IsFluid="true" ShowHeader="false" ShowBorder="false" LabelWidth="108">
                    <Items>
                        <f:NumberBox runat="server" ID="nbxMinimum" Label="最低金额（元）" NoDecimal="true" NoNegative="true" />
                        <f:Button runat="server" ID="btnFilter" Text="筛选" OnClick="FilterSales" />
                    </Items>
                </f:SimpleForm>
                <f:Chart runat="server" ID="ChartSalesThreshold" Height="550px" CategoryField="Category">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Bar" Name="销售额（元）" ValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>

        <p>输入最低销售额并点击「筛选」，只保留达到门槛的区域。输入 0 显示全部，超出所有区域金额时显示空结果。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li><code>NumberBox</code> 后台校验输入为非负整数。门槛包含等于该金额的区域。</li>
                <li><code>OnClick</code> 在点击筛选后一次性更新柱图和命中数。</li>
            </ul>
        </section>
    </form>
</body>
</html>
