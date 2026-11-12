<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_dayrange_mindate.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_dayrange_mindate" %>

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
            <p>演示限制日期范围的可选上下限，超出范围的项目不能选中。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>检查可选范围</h3>
            <ul>
                <li>
                    切换到下限之前或上限之后的日期、年份或月份，尝试点击。<br />
                    结果：超出本页限制的项目不可选；可选择范围以内的项目。上下限按当前日期计算的页面，每天随日期变化。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>MinDate</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：限定最早可选的日期、月份或年份；下限之前的项目不能选中。</li>
                <li><code>MaxDate</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：限定最晚可选的日期、月份或年份；上限之后的项目不能选中。</li>
            </ul>
        </section>
    </template>
</body>
</html>
