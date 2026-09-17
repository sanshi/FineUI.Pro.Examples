<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_download.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.alert_download" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/message/alert_download_textfile.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="操作（先弹出提示框，点击确定后下载文件）" runat="server" ID="btnOperation" OnClick="btnOperation_Click">
        </f:Button>
    </form>
    <script>
        function confirmOKCallback() {
            window.location.href = F.resolveUrl('/message/alert_download_textfile.ashx');
        }

        function confirmCancelCallback() {
            F.customEvent('ConfirmCancel');
        }

    </script>
</body>
</html>
