<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_maximized_script.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_maximized_script" %>

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
        <f:Button ID="btnShowWindow" Text="显示窗体（使用初始值）" runat="server" ClickHandler="onShowWindowClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnCloseWindow" Text="关闭窗体" runat="server" ClickHandler="onCloseWindowClick">
        </f:Button>
        <br />
        <br />

        <br />
        <f:Window ID="Window1" Width="650px" Height="300px" Icon="TagBlue" Title="窗体" EnableCollapse="false" runat="server" EnableResize="true" IsModal="false"
            AutoScroll="true" BodyPadding="10px" EnableMaximize="true">
            <Content>
                <p>
                    <a href="http://tech.163.com/special/jobsdead/" target="_blank"><b>乔布斯</b></a>
                </p>
                <p>
                    乔布斯于1955年2月24日出生，苹果创始人之一。今年8月苹果超越埃克森美孚成为全球最大市值企业，截止上季度持有现金达到762亿美金，甚至超过了美国政府国库存款。
                </p>
                <p>
                    遗憾的是，苹果的取得巨大成功还是无法给乔布斯一个健康的身体，乔布斯2003年被发现患有胰脏癌，随后又查出肝癌，危在旦夕的乔布斯在经历了8年的抗癌斗争、3次病休、若干次手术后，于2011年8月25日正式宣布从CEO位置辞职。2011年10月6日，乔布斯在苹果发布iPhone
                    4S后的第二天与世长辞。
                </p>
                <br />
                <br />
                <strong>注意如下两个示例的差别：</strong>
                <ul>
                    <li>窗体（最大化，Maximized）：还原窗体大小，关闭窗体，点击[显示窗体（使用初始值）]按钮，窗体默认最大化。
                    </li>
                    <li>窗体（最大化，GetMaximizeReference）：还原窗体大小，关闭窗体，点击[显示窗体（使用初始值）]按钮，窗体默认650px*300px。
                    </li>
                </ul>
            </Content>
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:Button ID="btnServerMaximize" Text="服务端最大化" OnClick="btnServerMaximize_Click" runat="server" />
                        <f:Button ID="btnServerRestore" Text="服务端还原" OnClick="btnServerRestore_Click" runat="server" />
                        <f:Button ID="btnServerClose" Text="服务端关闭" OnClick="btnServerClose_Click" runat="server" />
                        <f:CheckBox ID="cbBlockClose" Text="阻止关闭" runat="server" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Listeners>
                <f:Listener Event="beforeclose" Handler="onBeforeServerWindowClose" />
                <f:Listener Event="close" Handler="onServerWindowClose" />
            </Listeners>
        </f:Window>
        <f:Label ID="labWindowEvent" runat="server" />
    </form>
    <script>
        var cbBlockCloseClientID = '<%= cbBlockClose.ClientID %>';
        var labWindowEventClientID = '<%= labWindowEvent.ClientID %>';
        // 关闭命令遵守 beforeclose 取消；close 回调在窗体隐藏完成后才执行。
        function onBeforeServerWindowClose(event) {
            if (F(cbBlockCloseClientID).getValue()) {
                F(labWindowEventClientID).setText('关闭已取消');
                return false;
            }
        }

        function onServerWindowClose(event) {
            F(labWindowEventClientID).setText('窗体已关闭');
        }


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
    <p>通过启动代码让窗体初次最大化，并对照后续显示与尺寸设置。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>对照本页窗体效果</h3>
    <ul>
        <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体">窗体</strong>。点击标题栏还原图标，再点击设置大小为 900px × 450px 的显示按钮。<br />结果：窗体按指定尺寸显示；再次选择最大化显示时占满当前可用视口。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>后台更新与取消关闭</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnServerMaximize").ClientID %>' title="服务端最大化">服务端最大化</strong>。<br />结果：回发后窗体最大化。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnServerRestore").ClientID %>' title="服务端还原">服务端还原</strong>。<br />结果：回发后窗体恢复普通尺寸。</li>
        <li>勾选<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("cbBlockClose").ClientID %>' title="阻止关闭">阻止关闭</strong>，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnServerClose").ClientID %>' title="服务端关闭">服务端关闭</strong>按钮。<br />结果：关闭被客户端事件取消，窗体保持显示；取消勾选后再次关闭才能隐藏。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableMaximize</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体">窗体</strong>）：初始为 <code>true</code>，控制标题栏是否显示最大化与还原入口。</li>
    </ul>
</section>
</template>
</body>
</html>
