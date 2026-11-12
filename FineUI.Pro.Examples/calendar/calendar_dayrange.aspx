<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_dayrange.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_dayrange" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy-MM-dd"
            OnDateSelect="Calendar1_DateSelect" ID="Calendar1" DisplayType="DayRange">
        </f:Calendar>
        <br />
        <br />
        <f:Button runat="server" ID="Button1" CssClass="marginr" OnClick="Button1_Click">
        </f:Button>
        <f:Button runat="server" ID="Button2" Text="获取选中的值" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult1" ShowLabel="false" runat="server">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示在页面内直接选择日期范围。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择日期范围</h3>
            <ul>
                <li>
                    依次将起点和终点选择为今天之后第<code>5</code>天到第<code>10</code>天。<br />
                    结果：面板高亮当前选择，范围显示起止两个值。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>响应选择事件</h3>
            <ul>
                <li>
                    改变当前日期范围并完成选择。<br />
                    结果：触发本页选择事件回发，后台读取当前选择并更新下方结果。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>由按钮设置选择</h3>
            <ul>
                <li>
                    点击日历下方以“选中”开头的按钮。<br />
                    结果：后台把日历改为按钮文字标明的日期范围；面板高亮随之更新，下方显示当前值。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：设为<code>yyyy-MM-dd</code>，控制选中值的文字格式。</li>
                <li><code>DisplayType</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：本页采用日期范围面板，选择起点和终点。</li>
                <li><code>RangeStartDate</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：设置范围起点，与终点共同组成当前范围。</li>
                <li><code>RangeEndDate</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：设置范围终点，与起点共同组成当前范围。</li>
                <li><code>OnDateSelect</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：完成日历选择后回发，后台读取当前选择并更新结果标签。</li>
            </ul>
        </section>
    </template>
</body>
</html>
