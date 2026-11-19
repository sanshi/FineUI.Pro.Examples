<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="date_range.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineDateRange" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/data/DailyVisitData.cs;~/chart/data/ChartDataRows.cs" />
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
                <f:SimpleForm runat="server" ID="SimpleFormDateRange" IsFluid="true" MaxWidth="280px" ShowHeader="false" ShowBorder="false" LabelAlign="Top">
                    <Items>
                        <f:DatePicker runat="server" ID="dpVisitRange" Label="日期范围" DateFormatString="yyyy-MM-dd" DisplayType="DayRange" EnableEdit="false"
                            OnTextChanged="dpVisitRange_TextChanged" />
                    </Items>
                </f:SimpleForm>
                <f:Chart runat="server" ID="ChartVisitRange" Height="550px" DataCategoryField="Category">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Line" Name="访问量" DataValueField="Amount" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>



    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在日期范围选择器中选完起止日期，折线和访问量汇总会自动更新。演示数据覆盖 2026 年 9 月 1 日至 12 日。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>选定起止日期</h3>
            <ul>
                <li>打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("dpVisitRange").ClientID %>'
                        title="日期范围">日期范围</strong>，依次选择 2026-09-03 和 2026-09-06。<br />结果：选完两个日期后后台筛选区间数据，折线只保留 9 月 3 日至 6 日的点，汇总同步更新。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DisplayType</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("dpVisitRange").ClientID %>' title="日期范围">日期范围</strong>）：初始为
                    <code>DayRange</code>，在同一个弹层中选择开始和结束日期，两端都计入统计。选完第二个日期时触发更新。
                </li>
                <li><code>DataBind()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ChartVisitRange").ClientID %>'
                        title="图表">图表</strong>）：同一批查询结果同时用于绘制折线、计算天数和访问量。</li>
            </ul>
        </section>
    </template>
</body>
</html>
