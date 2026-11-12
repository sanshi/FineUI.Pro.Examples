<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_percent.aspx.cs" Inherits="FineUI.Pro.Examples.window.window_percent" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
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

        <f:Window ID="Window2" Icon="TagBlue" Title="窗体（PercentWidth=50% PercentHeight=50%）" PercentWidth="50%" PercentHeight="50%"
            runat="server" IsModal="false" AutoScroll="true" BodyPadding="10px">
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
    <p>让窗体宽高分别占当前视口的一半。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>对照本页窗体效果</h3>
    <ul>
        <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体（PercentWidth=50% PercentHeight=50%）">窗体（PercentWidth=50% PercentHeight=50%）</strong>。<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnShowInClient").ClientID %>' title="显示窗体">显示窗体</strong>后调整浏览器窗口大小，关闭后再次打开。<br />结果：宽高按当前视口的 50% 计算，重新打开仍使用该比例。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>PercentWidth</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体（PercentWidth=50% PercentHeight=50%）">窗体（PercentWidth=50% PercentHeight=50%）</strong>）：初始为 <code>50%</code>，按可用视口宽度的百分比计算窗体宽度。</li>
        <li><code>PercentHeight</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window2").ClientID %>' title="窗体（PercentWidth=50% PercentHeight=50%）">窗体（PercentWidth=50% PercentHeight=50%）</strong>）：初始为 <code>50%</code>，按可用视口高度的百分比计算窗体高度。</li>
    </ul>
</section>
</template>
</body>
</html>
