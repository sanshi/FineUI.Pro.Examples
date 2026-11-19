<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position_calendar.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_position_calendar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">
        <style>
            .mybgpanel>.f-panel-bodyct>.f-panel-body {
                background-color: #FEF3D5;
                background-image: url('<%= PageContext.ResolveUrl("~/res/images/bg/small/3.jpg") %>');
                background-position: right bottom;
                background-repeat: no-repeat;
            }

            .mywindow,
            .mywindow>.f-panel-bodyct>.f-panel-body {
                background-image: none;
                background-color: transparent;
                -moz-box-shadow: none;
                -webkit-box-shadow: none;
                box-shadow: none;
            }

        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" CssClass="mybgpanel" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigSpace="5" BodyPadding="10px" runat="server">
            <Items>
                <f:Button runat="server" ID="btnOpenWindow" Text="选择日期" ClickHandler="onOpenWindow1Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" CssClass="mywindow" ShowHeader="false" ShowBorder="false" Hidden="true" HideOnMaskClick="true" IsModal="true"
            BodyPadding="10px" Layout="VBox" BoxConfigSpace="5" PercentWidth="100%" EnableDefaultCorner="false" PositionY="Bottom">
            <Items>
                <f:Calendar runat="server" ID="Calendar1" DateFormatString="yyyy-MM-dd" MarginBottom="10px">
                    <Listeners>
                        <f:Listener Event="select" Handler="onCalendar1Select" />
                    </Listeners>
                </f:Calendar>
                <f:Button runat="server" ID="Button3" Text="取消" ClickHandler="onCloseWindow1Click"></f:Button>
            </Items>
        </f:Window>
    </form>

    <script>
        var window1ClientID = '<%= Window1.ClientID %>';
        var calendar1ClientID = '<%= Calendar1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(window1ClientID).show();
        }

        function onCloseWindow1Click(event) {
            F(window1ClientID).hide();
        }


        function onCalendar1Select(event) {
            F(window1ClientID).hide();
            showCenterNotify('你选择的日期是：' + F(calendar1ClientID).getText());
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示从底部打开日历面板，选定日期后隐藏面板并显示选择结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>在日历中选择日期</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOpenWindow").ClientID %>'
                        title="选择日期">选择日期</strong>。<br />结果：底部动作面板显示本页日历。</li>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Calendar1").ClientID %>'
                        title="日历">日历</strong>点击一个可选日期。<br />结果：客户端读取当前日期，隐藏动作面板，并按本页格式显示选择提示。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PositionY</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="窗口">窗口</strong>）：初始为<code>Bottom</code>，选择面板贴底显示。</li>
                <li><code>DateFormatString</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Calendar1").ClientID %>'
                        title="日历">日历</strong>）：初始为<code>yyyy-MM-dd</code>，按本页 <code>yyyy</code>-<code>MM</code>-<code>dd</code> 格式显示选择结果。</li>
                <li><code>select</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Calendar1").ClientID %>' title="日历">日历</strong>）：日历选择完成后执行本页结果处理。</li>
            </ul>
        </section>
    </template>
</body>
</html>
