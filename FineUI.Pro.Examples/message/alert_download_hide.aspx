<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_download_hide.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.alert_download_hide" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/message/alert_download_textfile.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" Width="650px" Height="300px" Icon="TagBlue" Title="窗体" EnableMaximize="true" EnableCollapse="false" runat="server"
            EnableResize="true" IsModal="false" BodyPadding="10px">
            <Items>
                <f:Button Text="操作（先弹出提示框，点击确定后先关闭弹出窗体，然后下载文件）" runat="server" ID="btnOperation" OnClick="btnOperation_Click">
                </f:Button>
            </Items>
        </f:Window>
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
