<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_display_time.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_display_time" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="HH:mm:ss" DisplayType="Time" ShowTodayButton="false"
            OnDateSelect="Calendar1_DateSelect" ID="Calendar1">
        </f:Calendar>
        <br />
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult1" ShowLabel="false" runat="server">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示在页面内直接只选择时间，无需选择日期。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择时间</h3>
            <ul>
                <li>
                    在面板中选择<code>09</code>时<code>30</code>分。<br />
                    结果：面板高亮当前选择。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>"
                        title="日历">日历</strong>）：初始为<code>HH:mm:ss</code>，控制选中值的文字格式。</li>
                <li><code>DisplayType</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>"
                        title="日历">日历</strong>）：本页采用时间面板，一次选择一个值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
