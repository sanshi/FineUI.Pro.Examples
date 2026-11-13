<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position_slideup.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_position_slideup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigSpace="5" BodyPadding="10px" runat="server">
            <Items>
                <f:Button runat="server" ID="btnOpenWindow" Text="从下方滑入窗体" ClickHandler="onOpenWindow1Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" ShowHeader="false" Hidden="true" IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="Fit"
            PercentWidth="100%" PercentHeight="100%" EnableDefaultCorner="false" PositionY="Bottom">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="弹出窗体标题" runat="server" HeaderStyle="true" ToolbarAlign="Right">
                    <Items>
                        <f:Button runat="server" ID="Button1" Text="关闭" ClickHandler="onCloseWindow1Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:ContentPanel runat="server" ShowBorder="false" ShowHeader="false" AutoScroll="true">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Window>

    </form>
    <script>
        var window1ClientID = '<%= Window1.ClientID %>';

        function onOpenWindow1Click(event) {
            F(window1ClientID).show();
        }

        function onCloseWindow1Click(event) {
            F(window1ClientID).hide();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示从底部滑入一个满屏移动窗体，并通过内部标题栏按钮关闭。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>滑入后关闭</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOpenWindow").ClientID %>'
                        title="从下方滑入窗体">从下方滑入窗体</strong>。<br />结果：窗体从底部进入，按本页设置占满当前视口，内部标题与内容同时显示。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="关闭">关闭</strong>。<br />结果：浏览器隐藏当前窗体，恢复下方原页面。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PositionY</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="窗口">窗口</strong>）：初始为<code>Bottom</code>，窗体贴底定位。</li>
                <li><code>PercentWidth</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="窗口">窗口</strong>）：初始为<code>100%</code>，使用当前视口全部宽度。</li>
                <li><code>PercentHeight</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>'
                        title="窗口">窗口</strong>）：初始为<code>100%</code>，使用当前视口全部高度。</li>
                <li><code>show()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗口">窗口</strong>）：本页传入滑动显示参数，避免只作普通居中弹出。</li>
            </ul>
        </section>
    </template>
</body>
</html>
