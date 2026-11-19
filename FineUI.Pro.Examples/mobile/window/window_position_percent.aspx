<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_position_percent.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_position_percent" %>

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
                <f:Button runat="server" ID="btnOpenWindow" Text="左侧窗体" ClickHandler="onOpenWindow1Click"></f:Button>
                <f:Button runat="server" ID="Button1" Text="右侧窗体" ClickHandler="onOpenWindow2Click"></f:Button>
                <f:Button runat="server" ID="Button2" Text="顶部窗体" ClickHandler="onOpenWindow3Click"></f:Button>
                <f:Button runat="server" ID="Button3" Text="底部窗体" ClickHandler="onOpenWindow4Click"></f:Button>
                <f:Button runat="server" ID="Button4" Text="居中窗体" ClickHandler="onOpenWindow5Click"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" ShowHeader="false" Hidden="true" IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="Fit"
            PercentWidth="50%" PercentHeight="100%" EnableDefaultCorner="false" PositionX="Left">
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
        <f:Window runat="server" ID="Window2" ShowHeader="false" Hidden="true" IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="Fit"
            PercentWidth="50%" PercentHeight="100%" EnableDefaultCorner="false" PositionX="Right">
            <Items>
                <f:ContentPanel ID="ContentPanel1" runat="server" ShowBorder="false" ShowHeader="false" AutoScroll="true">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Window>
        <f:Window runat="server" ID="Window3" ShowHeader="false" Hidden="true" IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="Fit"
            PercentWidth="100%" PercentHeight="50%" EnableDefaultCorner="false" PositionY="Top">
            <Items>
                <f:ContentPanel ID="ContentPanel2" runat="server" ShowBorder="false" ShowHeader="false" AutoScroll="true">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Window>
        <f:Window runat="server" ID="Window4" ShowHeader="false" Hidden="true" IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="Fit"
            PercentWidth="100%" PercentHeight="50%" EnableDefaultCorner="false" PositionY="Bottom">
            <Items>
                <f:ContentPanel ID="ContentPanel3" runat="server" ShowBorder="false" ShowHeader="false" AutoScroll="true">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Window>
        <f:Window runat="server" ID="Window5" ShowHeader="false" Hidden="true" IsModal="true" HideOnMaskClick="true" BodyPadding="10px" Layout="Fit"
            PercentWidth="80%" PercentHeight="50%">
            <Items>
                <f:ContentPanel ID="ContentPanel4" runat="server" ShowBorder="false" ShowHeader="false" AutoScroll="true">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                        <br />
                        ok.<br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        ok.<br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        ok.<br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        ok.<br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        ok.
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Window>
    </form>
    <script>
        var window1ClientID = '<%= Window1.ClientID %>';
        var window2ClientID = '<%= Window2.ClientID %>';
        var window3ClientID = '<%= Window3.ClientID %>';
        var window4ClientID = '<%= Window4.ClientID %>';
        var window5ClientID = '<%= Window5.ClientID %>';

        function onOpenWindow1Click(event) {
            F(window1ClientID).show();
        }

        function onOpenWindow2Click(event) {
            F(window2ClientID).show();
        }

        function onOpenWindow3Click(event) {
            F(window3ClientID).show();
        }

        function onOpenWindow4Click(event) {
            F(window4ClientID).show();
        }

        function onOpenWindow5Click(event) {
            F(window5ClientID).show();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示按视口百分比设置侧边或居中窗体尺寸。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>比较窗体位置和占比</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOpenWindow").ClientID %>'
                        title="左侧窗体">左侧窗体</strong>。<br />结果：窗体贴左显示，占本页配置的 <code>50%</code> 宽度和 <code>100%</code> 高度。</li>
                <li>点击遮罩关闭，再依次打开右侧、顶部、底部和居中窗体。<br />结果：各窗体按本页百分比计算尺寸；居中示例使用 <code>80%</code> 宽度和 <code>50%</code> 高度。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>PositionX</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1 个窗口</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="第 2 个窗口">第
                        2 个窗口</strong>）：各组分别设为<code>Left</code>、<code>Right</code>，指定水平位置，左侧和右侧窗体分别贴对应边缘。</li>
                <li><code>PositionY</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window3").ClientID %>' title="第 3 个窗口">第 3 个窗口</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window4").ClientID %>' title="第 4 个窗口">第
                        4 个窗口</strong>）：各组分别设为<code>Top</code>、<code>Bottom</code>，指定垂直位置，顶部和底部窗体分别贴对应边缘。</li>
                <li><code>PercentWidth</code>（本页各窗口，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1
                        个窗口</strong>）：各组分别设为<code>50%</code>、<code>100%</code>、<code>80%</code>，根据当前视口宽度计算窗体宽度。</li>
                <li><code>PercentHeight</code>（本页各窗口，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="第 1 个窗口">第 1
                        个窗口</strong>）：各组分别设为<code>100%</code>、<code>50%</code>，根据当前视口高度计算窗体高度。</li>
            </ul>
        </section>
    </template>
</body>
</html>
