<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_time_noinitialvalue.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_time_noinitialvalue" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy-MM-dd HH:mm:ss"
            OnDateSelect="Calendar1_DateSelect" ID="Calendar1" ShowTime="true">
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
            <p>演示日期时间初始为空，选择或点击快捷按钮后才写入值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择日期时间</h3>
            <ul>
                <li>
                    先观察初始面板尚未高亮日期，再在面板中选择今天之后第<code>5</code>天<code>09</code>时<code>30</code>分。<br />
                    结果：面板高亮当前选择。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SelectedDate</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：本页首次加载不预先赋值；完成选择后，才保存对应的当前值。本页初始不赋选中值；用户选择或点击快捷按钮后才产生当前值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
