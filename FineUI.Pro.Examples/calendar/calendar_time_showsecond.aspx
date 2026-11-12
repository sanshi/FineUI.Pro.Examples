<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_time_showsecond.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_time_showsecond" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy-MM-dd HH:mm"
            OnDateSelect="Calendar1_DateSelect" ID="Calendar1" ShowTime="true" ShowSecond="false">
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
            <p>演示选择日期时间时隐藏秒列，只显示和读取到分钟。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-time" aria-hidden="true"></i>只选择小时和分钟</h3>
            <ol>
                <li>
                    查看日历的时间区域，分别选择小时和分钟。<br />
                    结果：时间区域不显示秒列，所选日期时间的显示文字也不包含秒。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：设为<code>yyyy-MM-dd HH:mm</code>，控制选中值的文字格式。</li>
                <li><code>ShowSecond</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：设为 <code>false</code>，时间面板只显示小时和分钟，不创建秒列；输出格式也不含秒。</li>
            </ul>
        </section>
    </template>
</body>
</html>
