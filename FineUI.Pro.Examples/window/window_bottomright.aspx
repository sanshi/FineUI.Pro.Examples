<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_bottomright.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_bottomright" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mywnd {
            top: auto !important;
            left: auto !important;
            bottom: 2px !important;
            right: 2px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnShowInClient" Text="显示窗体"
            runat="server" ClickHandler="onShowInClientClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnHideInClient" Text="隐藏窗体"
            runat="server" ClickHandler="onHideInClientClick">
        </f:Button>

        <f:Window ID="Window2" Width="500px" Height="200px" Icon="TagBlue" Title="窗体"
            runat="server" EnableDrag="false" CssClass="mywnd"
            IsModal="false" AutoScroll="true" BodyPadding="10px">
            <Content>
                <p>
                    <a href="http://tech.163.com/special/jobsdead/" target="_blank"><b>乔布斯</b></a>
                </p>
                <p>
                    乔布斯于1955年2月24日出生，苹果创始人之一。今年8月苹果超越埃克森美孚成为全球最大市值企业，截止上季度持有现金达到762亿美金，甚至超过了美国政府国库存款。 
                </p>
            </Content>
        </f:Window>
    </form>
    <script>

        var Window2ClientID = '<%= Window2.ClientID %>';

        function onShowInClientClick(event) {
            F(Window2ClientID).show();
        }

        function onHideInClientClick(event) {
            F(Window2ClientID).hide();
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>用固定定位把窗体放在页面右下角，并禁止标题栏拖动。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>对照本页窗体效果</h3>
    <ul>
        <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体">窗体</strong>。<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowInClient").ClientID %>' title="显示窗体">显示窗体</strong>后尝试拖动标题栏，再调整浏览器窗口大小。<br />结果：标题栏不能拖动，窗体继续贴在页面右下角。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableDrag</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体">窗体</strong>）：初始为 <code>false</code>，控制是否允许拖动标题栏移动窗体。</li>
        <li><code>CssClass</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体">窗体</strong>）：初始为 <code>mywnd</code>，使用本页定义的 CSS 类设置外观。</li>
    </ul>
</section>
</template>
</body>
</html>
