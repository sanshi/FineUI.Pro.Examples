<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_maximized_fixed.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_maximized_fixed" %>

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
        <f:Window ID="Window1" Width="650px" Height="300px" Icon="TagBlue" Title="窗体（不能还原窗体大小）"
            EnableCollapse="false" runat="server" EnableResize="true"
            IsModal="false" AutoScroll="true" BodyPadding="10px"
            EnableMaximize="false" Maximized="true">
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
    <p>让窗体保持初始最大化，隐藏标题栏的最大化切换入口。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>对照本页窗体效果</h3>
    <ul>
        <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体（不能还原窗体大小）">窗体（不能还原窗体大小）</strong>。查看窗体标题栏，并尝试与可还原的最大化示例对照。<br />结果：窗体初次占满可用区域，标题栏不提供还原图标。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Maximized</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体（不能还原窗体大小）">窗体（不能还原窗体大小）</strong>）：初始为 <code>true</code>，控制窗体初次显示时是否最大化。</li>
        <li><code>EnableMaximize</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="窗体（不能还原窗体大小）">窗体（不能还原窗体大小）</strong>）：初始为 <code>false</code>，控制标题栏是否显示最大化与还原入口。</li>
    </ul>
</section>
</template>
</body>
</html>
