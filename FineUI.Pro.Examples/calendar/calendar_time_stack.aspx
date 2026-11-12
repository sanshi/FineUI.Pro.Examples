<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_time_stack.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_time_stack" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy-MM-dd HH:mm:ss"
            OnDateSelect="Calendar1_DateSelect" ID="Calendar1" ShowTime="true" StackDateTime="true">
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
            <p>演示把日期网格与时间列上下排列，在同一面板选择日期和时间。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>在同一面板上下选择日期和时间</h3>
            <ol>
                <li>
                    展开日期时间面板，对照日期与时间区域，再分别调整日期、小时和分钟。<br />
                    结果：日期和时间上下排列在同一个面板中，无需在两种视图之间来回切换。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>StackDateTime</code>：设为 true，日期网格与时间列上下排列，适合较窄的面板。</li>
            </ul>
        </section>
    </template>
</body>
</html>
