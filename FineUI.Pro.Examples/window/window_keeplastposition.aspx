<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_keeplastposition.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_keeplastposition" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnShowWindowMax" Text="显示窗体（设置最大化）" runat="server" ClickHandler="onShowWindowMaxClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowWindow900" Text="显示窗体（设置大小为 900px * 450px）" runat="server" ClickHandler="onShowWindow900Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowWindowLargeHeight" Text="显示窗体（高度占满整个页面）" runat="server" ClickHandler="onShowWindowLargeHeightClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowWindow" Text="显示窗体（保持关闭时的位置和大小）" runat="server" ClickHandler="onShowWindowClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnCloseWindow" Text="关闭窗体" runat="server" ClickHandler="onCloseWindowClick">
        </f:Button>
        <br />
        <br />
        <br />
        注：本示例设置了窗体的KeepLastPosition="true"和KeepLastSize="true"，关闭窗体再打开时，窗体的位置和大小保持关闭时的状态。
        <br />
        <f:Window ID="Window1" Width="650px" Height="300px" Icon="TagBlue" Title="窗体" Hidden="true"
            EnableMaximize="true" EnableCollapse="false" runat="server" EnableResize="true"
            IsModal="false" AutoScroll="true" BodyPadding="10px" 
            KeepLastPosition="true" KeepLastSize="true">
            <Content>
                <p>
                    <a href="http://tech.163.com/special/jobsdead/" target="_blank"><b>乔布斯</b></a>
                </p>
                <p>
                    乔布斯于1955年2月24日出生，苹果创始人之一。今年8月苹果超越埃克森美孚成为全球最大市值企业，截止上季度持有现金达到762亿美金，甚至超过了美国政府国库存款。 
                </p>
                <p>
                    遗憾的是，苹果的取得巨大成功还是无法给乔布斯一个健康的身体，乔布斯2003年被发现患有胰脏癌，随后又查出肝癌，危在旦夕的乔布斯在经历了8年的抗癌斗争、3次病休、若干次手术后，于2011年8月25日正式宣布从CEO位置辞职。2011年10月6日，乔布斯在苹果发布iPhone 4S后的第二天与世长辞。
                </p>
            </Content>
        </f:Window>
    </form>
    <script>

        var Window1ClientID = '<%= Window1.ClientID %>';

        function onShowWindowMaxClick(event) {
            F(Window1ClientID).show();
            F(Window1ClientID).maximize();
        }

        function onShowWindow900Click(event) {
            F(Window1ClientID).show(undefined, undefined, 900, 450);
        }

        function onShowWindowLargeHeightClick(event) {
            F(Window1ClientID).show(undefined, undefined, 900, 10000);
        }

        function onShowWindowClick(event) {
            F(Window1ClientID).show();
        }

        function onCloseWindowClick(event) {
            F(Window1ClientID).hide();
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>重新打开窗体时保留上次关闭前的位置与尺寸。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>对照本页窗体效果</h3>
    <ul>
        <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体">窗体</strong>。显示窗体，拖动标题栏并调整边缘大小，关闭后再点击保持关闭时位置和大小的显示按钮。<br />结果：窗体沿用关闭前的位置和尺寸；显式指定最大化或新尺寸的按钮仍按指定参数显示。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>KeepLastPosition</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体">窗体</strong>）：初始为 <code>true</code>，关闭后再次打开时，沿用关闭前的位置。</li>
        <li><code>KeepLastSize</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体">窗体</strong>）：初始为 <code>true</code>，关闭后再次打开时，沿用关闭前的尺寸。</li>
        <li><code>EnableResize</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体">窗体</strong>）：初始为 <code>true</code>，控制是否允许拖动窗体边缘调整大小。</li>
    </ul>
</section>
</template>
</body>
</html>
