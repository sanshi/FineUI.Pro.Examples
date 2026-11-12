<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parent_postback.aspx.cs"
    Inherits="FineUI.Pro.Examples.iframe.parent_postback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/parent_postback2.aspx;~/iframe/parent_postback3.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        页面一：parent_postback.aspx
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        <f:Button ID="Button1" CssClass="marginr" runat="server" Text="页面一中的按钮">
        </f:Button>
        <f:Button CssClass="marginr" ID="btnServerRefresh" runat="server" Text="服务端刷新面板 IFrame" OnClick="btnServerRefresh_Click" />
        <f:Button ID="Button2" runat="server" Text="刷新面板一中的IFrame" ClickHandler="onRefreshIFrameClick">
        </f:Button>
        <br />
        <br />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false" Height="500px" EnableIFrame="true"
            IFrameUrl="parent_postback2.aspx" ShowHeader="true" Title="面板一">
        </f:Panel>
    </form>
    <script>
        var Panel1ClientID = '<%= Panel1.ClientID %>';

        function onRefreshIFrameClick(event) {
            F(Panel1ClientID).refreshIFrame();
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示从多层 <code>iframe</code> 中通知外层页面，区分当前子页与最终需要更新的父页。</p>
    <h3><i class="f-iconfont f-iconfont-refresh" aria-hidden="true"></i>从内层通知外层</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板一">面板一</strong>逐层进入子页，点击其中通知外层页面的入口。<br />结果：目标父页处理对应回发或更新脚本，外层结果标签显示本次通知；已有 <code>iframe</code> 结构保留。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnServerRefresh").ClientID %>' title="服务端刷新面板 IFrame">服务端刷新面板 IFrame</strong>。<br />结果：只刷新指定面板中的 <code>iframe</code>，不重新加载整个外层页面。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableIFrame</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板一">面板一</strong>）：面板承载下一层独立页面。 本页使用<code>true</code>。</li>
        <li><code>IFrameUrl</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板一">面板一</strong>）：指定下一层页面地址。 本页使用<code>parent_postback2.aspx</code>。</li>
        <li><code>GetCustomEventReference()</code>（<strong>子页通知代码</strong>）：子页向实际目标父页发送本例约定的事件和参数。</li>
    </ul>
</section>
</template>
</body>
</html>
