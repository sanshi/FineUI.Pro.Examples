<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notify_group_newesttop.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.notify_group_newesttop" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/js/notify_group.js" />
    <style>

        .notify-group-item .f-messagebox-message {
            min-width: 260px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="弹出通知对话框（多次点击）" runat="server" ID="btnOperation1" ClickHandler="onOperation1Click"></f:Button>
        <br />
        <br />
    </form>

    <script src="../res/js/notify_group.js"></script>
    <script type="text/javascript">

        var _orderNumber = 0;

        function onOperation1Click(event) {
            // 创建一个消息对话框实例
            var displayTime = 2000 + Math.random() * 10000;

            var allMessageIcons = ['information', 'warning', 'question', 'error', 'success'];
            showNotifyGroup({
                message: F.rawHtml('这是第<strong>' + _orderNumber + '</strong>条提示信息，显示' + Math.floor(displayTime / 1000) + '秒'),
                messageIcon: allMessageIcons[_orderNumber % allMessageIcons.length],
                header: false,
                displayMilliseconds: displayTime
            }, true);

            _orderNumber++;
        }

    </script>
</body>
</html>
