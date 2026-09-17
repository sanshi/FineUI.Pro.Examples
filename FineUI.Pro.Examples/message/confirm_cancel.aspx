<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm_cancel.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.confirm_cancel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="操作一（ConfirmText）" runat="server" ID="btnOperation1" ConfirmText="确认执行操作一？" ConfirmTarget="Top" OnClick="btnOperation1_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="操作二（ClickHandler）" runat="server" ID="btnOperation2" ClickHandler="onOperation2Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="操作三（ClickHandler，点击取消按钮也回发）" runat="server" ID="btnOperation3" ClickHandler="onOperation3Click">
        </f:Button>
    </form>
    <script>
        function onOperation2Click(event) {
            F.confirm({
                message: '确认执行操作二？',
                // ClickHandler 已完全接管按钮点击；确认后发送语义明确的页面级自定义事件。
                ok: function() {
                    F.customEvent('Operation2Confirm');
                },
                messageIcon: 'question'
            });
        }

        function onOperation3Click(event) {
            F.confirm({
                message: '确认执行操作三？',
                ok: function() {
                    F.customEvent('Operation3Confirm');
                },
                cancel: function() {
                    F.customEvent('Operation3Cancel');
                },
                messageIcon: 'question'
            });
        }

    </script>
</body>
</html>
