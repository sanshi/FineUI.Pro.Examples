<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_monthrange_confirmbutton.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_monthrange_confirmbutton" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy/MM" DisplayType="MonthRange" OnDateSelect="Calendar1_DateSelect"
            ID="Calendar1" ShowConfirmButton="true" ConfirmToSelect="true">
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
            <p>演示年月范围先暂存选择，点击<strong>确定</strong>后才提交当前值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-calendar" aria-hidden="true"></i>选择年月范围</h3>
            <ol>
                <li>
                    依次将起点和终点选择为当前月份之后第<code>1</code>个月到第<code>2</code>个月。<br />
                    结果：选择暂存在面板中；还没有执行选中事件，输入框或下方结果保持原值。
                </li>
                <li>
                    点击面板中的<strong>确定</strong>。<br />
                    结果：完成选择并触发选中事件。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowConfirmButton</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>"
                        title="日历">日历</strong>）：显示面板中的<strong>确定</strong>按钮；是否延后提交选择由 <code>ConfirmToSelect</code> 控制。</li>
                <li><code>ConfirmToSelect</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>"
                        title="日历">日历</strong>）：将当前选择暂存在面板中，点击<strong>确定</strong>后才提交当前值并触发选中事件。</li>
            </ul>
        </section>
    </template>
</body>
</html>
