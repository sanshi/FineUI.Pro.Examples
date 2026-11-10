<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="date_range.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineDateRange" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/ChartInteractionData.cs" />
    <title>日期范围筛选折线图</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager runat="server" ID="PageManager1" />
        <f:Panel runat="server" IsFluid="true" Title="每日访问趋势" ShowHeader="true" ShowBorder="true" BodyPadding="8">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarText runat="server" ID="ToolbarTextChartScope" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:SimpleForm runat="server" ID="SimpleFormDateRange" IsFluid="true" ShowHeader="false" ShowBorder="false" LabelWidth="78">
                    <Items>
                        <f:DatePicker runat="server" ID="dpVisitRange" Label="日期范围" DateFormatString="yyyy-MM-dd"
                            DisplayType="DayRange" EnableEdit="false" OnTextChanged="dpVisitRange_TextChanged" />
                    </Items>
                </f:SimpleForm>
                <f:Chart runat="server" ID="ChartVisitRange" Height="550px" CategoryField="Category">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Line" Name="访问量" ValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>

        <p>在日期范围选择器中选完起止日期，折线和访问量汇总会自动更新。演示数据覆盖 2026 年 9 月 1 日至 12 日。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li><code>DisplayType="DayRange"</code> 在同一个弹层中选择开始和结束日期，两端都计入统计。选完第二个日期时触发更新。</li>
                <li><code>DataBind()</code> 同一批查询结果同时用于绘制折线、计算天数和访问量。</li>
            </ul>
        </section>
    </form>
</body>
</html>
