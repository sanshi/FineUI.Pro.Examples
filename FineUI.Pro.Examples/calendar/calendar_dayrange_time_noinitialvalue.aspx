<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_dayrange_time_noinitialvalue.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_dayrange_time_noinitialvalue" %>

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
            <p>演示日期时间范围初始为空，选择或点击快捷按钮后才写入值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择日期时间范围</h3>
            <ul>
                <li>
                    先观察初始面板尚未高亮日期，再依次将起点和终点选择为今天之后第<code>5</code>天<code>09</code>时<code>30</code>分到第<code>10</code>天<code>10</code>时<code>30</code>分。<br />
                    结果：面板高亮当前选择，范围显示起止两个值。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RangeStartDate</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：本页首次加载不预先赋值；完成选择后，才保存对应的当前值。本页初始不赋范围值；设置范围起点，与终点共同组成当前范围。</li>
                <li><code>RangeEndDate</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：本页首次加载不预先赋值；完成选择后，才保存对应的当前值。本页初始不赋范围值；设置范围终点，与起点共同组成当前范围。</li>
            </ul>
        </section>
    </template>
</body>
</html>
