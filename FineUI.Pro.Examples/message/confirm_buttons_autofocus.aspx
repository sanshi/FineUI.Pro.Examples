<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm_buttons_autofocus.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.confirm_buttons_autofocus" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="操作一（设置自动获取焦点的按钮）" runat="server" ID="btnOperation1" ClickHandler="onOperation1Click"></f:Button>
    </form>

    <script>

        function onOperation1Click(event) {

            F.create({
                type: 'MessageBox',
                message: '您即将直接退出，如果您修改了相关信息，请先保存！',
                title: '确认退出',
                buttons: [{
                    buttonId: 'ok',
                    text: '直接退出'
                }, {
                    buttonId: 'cancel',
                    text: '不退出'
                }],
                // 自动获取焦点的按钮 - buttonId
                autoFocusButtonId: 'cancel',
                handler: function (event, buttonId) {
                    if (buttonId === 'ok') {
                        F.customEvent('ConfirmOK');
                    } else {
                        F.customEvent('ConfirmCancel');
                    }
                }
            });

        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>为自定义确认框指定默认焦点按钮，避免按回车误触退出操作。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>确认默认焦点</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOperation1").ClientID %>' title="操作一（设置自动获取焦点的按钮）">操作一（设置自动获取焦点的按钮）</strong>。<br />结果：确认框打开后，不退出按钮自动获得焦点。</li>
        <li>保持默认焦点并按回车。<br />结果：执行不退出分支，并显示对应提示。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>buttons / autoFocusButtonId</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOperation1").ClientID %>' title="操作一（设置自动获取焦点的按钮）">操作一（设置自动获取焦点的按钮）</strong>）：按钮定义决定文案，焦点配置指向不退出按钮；回车触发当前焦点按钮。</li>
    </ul>
</section>
</template>
</body>
</html>
