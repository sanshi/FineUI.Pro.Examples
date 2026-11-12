<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_display_year.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_display_year" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy" DisplayType="Year" ShowTodayButton="false"
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
            <p>演示在页面内直接只选择年份。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择年份</h3>
            <ul>
                <li>
                    在面板中选择明年。<br />
                    结果：面板高亮当前选择。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：控制选中值的文字格式；本页使用 <code>yyyy</code>。</li>
                <li><code>DisplayType</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：本页采用年份面板，一次选择一个值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
