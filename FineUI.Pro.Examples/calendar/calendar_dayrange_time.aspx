<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_dayrange_time.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_dayrange_time" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy-MM-dd HH:mm:ss"
            OnDateSelect="Calendar1_DateSelect" ID="Calendar1" DisplayType="DayRange" ShowTime="true">
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
            <p>演示在页面内直接选择日期时间范围。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择日期时间范围</h3>
            <ul>
                <li>
                    依次将起点和终点选择为今天之后第<code>5</code>天<code>09</code>时<code>30</code>分到第<code>10</code>天<code>10</code>时<code>30</code>分。<br />
                    结果：面板高亮当前选择，范围显示起止两个值。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：控制选中值的文字格式；本页使用 <code>yyyy</code>-<code>MM</code>-<code>dd</code> <code>HH</code>:<code>mm</code>:<code>ss</code>。</li>
                <li><code>ShowTime</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：设为 <code>true</code>，在日期选择中同时提供时间列。</li>
            </ul>
        </section>
    </template>
</body>
</html>
