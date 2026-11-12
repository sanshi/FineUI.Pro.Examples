<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendar_height.aspx.cs" Inherits="FineUI.Pro.Examples.calendar.calendar_height" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-calendar-day {
            text-align: center;
        }

        .f-calendar-table th {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" Margin="24px" runat="server" Title="面板" ShowHeader="false" ShowBorder="true" Layout="Fit" BodyPadding="10px" Width="800px" Height="600px">
            <Toolbars>
                <f:Toolbar ID="ToolbarExample1" ClientIDMode="Static" runat="server" ToolbarAlign="Center" Position="Bottom">
                    <Items>
                        <f:Button runat="server" ID="Button1" OnClick="Button1_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Calendar runat="server" EnableDateSelectEvent="true" DateFormatString="yyyy-MM-dd"
                    OnDateSelect="Calendar1_DateSelect" ID="Calendar1" ShowTodayButton="false">
                </f:Calendar>
            </Items>
        </f:Panel>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示日历填满固定大小的面板，底部<strong class="example-control-reference" data-example-control="ToolbarExample1" title="工具栏">工具栏</strong>仍可快捷选中日期。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>在固定高度面板内显示日历</h3>
            <ol>
                <li>
                    对照日历主体和底部<strong class="example-control-reference" data-example-control="ToolbarExample1" title="工具栏">工具栏</strong>，调整浏览器大小。<br />
                    结果：外层面板保留本页指定的宽高，日历按 <code>Fit</code> 布局填充主体，<strong class="example-control-reference" data-example-control="ToolbarExample1" title="工具栏">工具栏</strong>保留自己的空间。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Panel.Layout</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：外层面板采用 <code>Fit</code>，日历填满主体可用空间，底部<strong class="example-control-reference" data-example-control="ToolbarExample1" title="工具栏">工具栏</strong>保留。</li>
                <li><code>Panel.Width</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：外层面板固定宽度为<code>800</code>像素，日历在其主体中布局。</li>
                <li><code>Panel.Height</code>（<strong class="example-control-reference" data-example-control="<%= Calendar1.ClientID %>" title="日历">日历</strong>）：外层面板固定高度为<code>600</code>像素，底部<strong class="example-control-reference" data-example-control="ToolbarExample1" title="工具栏">工具栏</strong>占用后保留其余主体空间给日历。</li>
            </ul>
        </section>
    </template>
</body>
</html>
