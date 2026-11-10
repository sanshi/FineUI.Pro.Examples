<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="date_focus.aspx.cs" Inherits="FineUI.Pro.Examples.chart.LineDateFocus" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="sourcefiles" content="~/chart/ChartInteractionData.cs" />
    <title>折线图与日期选择器双向联动</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" IsFluid="true" Title="每日访问量" ShowHeader="true" ShowBorder="true" BodyPadding="8">
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
                        <f:DatePicker runat="server" ID="dpFocus" Label="日期" DateFormatString="yyyy-MM-dd" />
                        <f:Button runat="server" ID="btnFocus" Text="查看当天" OnClick="btnFocus_Click" />
                    </Items>
                </f:SimpleForm>
                <f:Chart runat="server" ID="ChartDateFocus" Height="550px" CategoryField="Category" DataKeyField="Key" OnPointClick="ChartDateFocus_PointClick">
                    <Series>
                        <f:ChartSeries Key="amount" Type="Line" Name="访问量" ValueField="Amount" ColorField="Color" />
                    </Series>
                </f:Chart>
            </Items>
        </f:Panel>

        <p>点击折线上的日期点会填写日期并显示当天数据。也可以直接在日期选择器中选择一天，再点击「查看当天」。</p>
        <section aria-label="关键属性">
            <p><strong>关键属性</strong></p>
            <ul>
                <li><code>DataKeyField</code> 折线点提交完整日期，例如 2026-09-03，后台按该日期填写日期选择器。</li>
                <li><code>OnClick</code> 查询按钮读取日期选择器，和点选共用同一条记录查询。</li>
            </ul>
        </section>
    </form>
</body>
</html>
