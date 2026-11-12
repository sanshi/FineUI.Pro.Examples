<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_monthrange.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_monthrange" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy/MM" DisplayType="MonthRange"
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
            <p>演示在页面内直接只选择年月范围。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择年月范围</h3>
            <ul>
                <li>
                    依次将起点和终点选择为当前月份之后第1个月到第2个月。<br />
                    结果：面板高亮当前选择，范围显示起止两个值。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DateFormatString</code>：控制选中值的文字格式；本页使用 yyyy/MM。</li>
                <li><code>DisplayType</code>：本页采用年月范围面板，选择起点和终点。</li>
            </ul>
        </section>
    </template>
</body>
</html>
