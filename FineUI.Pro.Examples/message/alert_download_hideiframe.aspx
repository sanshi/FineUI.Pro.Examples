<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_download_hideiframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.message.alert_download_hideiframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/message/alert_download_hideiframe_window.aspx;~/message/alert_download_textfile.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体（EnableIFrame=true）" EnableMaximize="true" EnableCollapse="false"
            runat="server" EnableResize="true" IsModal="false" EnableIFrame="true" IFrameUrl="~/message/alert_download_hideiframe_window.aspx">
        </f:Window>
    </form>
    <script>
        function showConfirm() {
            F.confirm({
                message: '操作成功！点击确定按钮开始下载文件，点取消按钮弹出对话框',
                ok: function() {
                    window.location.href = F.resolveUrl('/message/alert_download_textfile.ashx');
                },
                cancel: function() {
                    F.customEvent('ConfirmCancel');
                }
            });
        }

    </script>
</body>
</html>
