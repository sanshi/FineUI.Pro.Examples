<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="region_filter.aspx.cs" Inherits="FineUI.Pro.Examples.chart.AreaRegionFilter" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/ChartInteractionData.cs" />
    <title>复选筛选面积图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <f:Panel runat="server" IsFluid="true" Title="所选区域月度销售额（元）" ShowHeader="true" ShowBorder="true" BodyPadding="8">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:CheckBoxList runat="server" ID="cblRegions" ShowLabel="false" ColumnNumber="3" AutoColumnWidth="true" OnSelectedIndexChanged="cblRegions_SelectedIndexChanged">
                    <f:CheckItem Text="华东" Value="east" Selected="true" />
                    <f:CheckItem Text="华北" Value="north" />
                    <f:CheckItem Text="华南" Value="south" />
                </f:CheckBoxList>
                <f:Chart runat="server" ID="ChartAreaSales" Height="550px" CategoryField="Category">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Area" Name="销售额（元）" ValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>

        <p>勾选一个或多个区域，面积图展示所选区域每个月的销售额合计。取消全部勾选会清空图表。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li><code>OnSelectedIndexChanged</code> 选项变动时立即提交当前完整选项集合，后台按月合计。</li>
                <li><code>DataBind()</code> 空选择对应空结果，后台提交空数据以清除原来的面积。</li>
            </ul>
        </section>
    </form>
</body>
</html>
