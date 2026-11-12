<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="server_error_custom_timeout.aspx.cs" Inherits="FineUI.Pro.Examples.other.server_error_custom_timeout" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%-- AJAX请求超时时间设为 2 秒 --%>
        <f:PageManager ID="PageManager1" AjaxTimeout="2" runat="server" />
        <f:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="服务器异常（500）">
        </f:Button>
        <br />
        <br />
    </form>
    <script>
        F.beforeAjaxError(function(data, textStatus, xhr) {

            if (textStatus === 'timeout') {
                showCenterNotify('AJAX请求超时！', 'error');
            }

            // 需要显式的返回 false，来阻止默认的错误处理
            return false;
        });

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>自行处理超过等待时间的 AJAX 请求，并显示超时通知。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>触发并识别请求错误</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>' title="服务器异常（500）">服务器异常（500）</strong>。<br />结果：等待超过本页超时设置后显示 AJAX 请求超时提示；这不是提交成功。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>F.beforeAjaxError()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button5").ClientID %>' title="服务器异常（500）">服务器异常（500）</strong>）：错误回调识别 timeout 状态，显示本页超时通知并结束默认处理。</li>
    </ul>
</section>
</template>
</body>
</html>
