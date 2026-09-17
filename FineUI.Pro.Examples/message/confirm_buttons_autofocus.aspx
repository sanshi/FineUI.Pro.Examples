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
</body>
</html>
