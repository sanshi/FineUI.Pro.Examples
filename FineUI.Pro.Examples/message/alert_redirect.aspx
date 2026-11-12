<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_redirect.aspx.cs" Inherits="FineUI.Pro.Examples.message.alert_redirect" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="弹出提示对话框" ID="Button1" runat="server" ClickHandler="onAlertAndRedirectClick">
        </f:Button>
        <br />
        <br />
        <f:Button Text="弹出提示对话框（服务器端）" ID="Button2" runat="server" OnClick="Button2_Click">
        </f:Button>
    </form>
    <script>

        function alertAndRedirect(message, redirectUrl) {
            F.alert({
                message: message,
                ok: function () {
                    window.location.href = redirectUrl;
                }
            });
        }

        function onAlertAndRedirectClick(event) {
            alertAndRedirect('点击确定后跳转页面', './alert.aspx');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>在用户确认提示后才跳转，分别对照客户端和后台发起的提示。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-link" aria-hidden="true"></i>确认后跳转</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="弹出提示对话框">弹出提示对话框</strong>，再点击提示框确定。<br />结果：先显示消息，确认回调再跳转到本页指定地址，打开提示时不立即离开。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="弹出提示对话框（服务器端）">弹出提示对话框（服务器端）</strong>，再点击提示框确定。<br />结果：先显示消息，确认回调再跳转到本页指定地址，打开提示时不立即离开。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>ok</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="弹出提示对话框">弹出提示对话框</strong>）：确认回调负责导航，消息显示与页面跳转按顺序执行。</li>
    </ul>
</section>
</template>
</body>
</html>
