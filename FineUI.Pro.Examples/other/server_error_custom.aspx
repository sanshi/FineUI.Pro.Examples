<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="server_error_custom.aspx.cs" Inherits="FineUI.Pro.Examples.other.server_error_custom" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="服务器异常（500）">
        </f:Button>
        <br />
        <br />
    </form>
    <script>
        F.beforeAjaxError(function(data, textStatus, xhr) {
            // 错误正文格式由服务端决定，这里只展示稳定的状态信息。
            var errorStatus = xhr.status ? 'HTTP ' + xhr.status : textStatus;
            F.alert({
                message: '这是自定义错误处理！服务器返回的状态：' + errorStatus,
                messageIcon: 'error'
            });

            // 需要显式的返回 false，来阻止默认的错误处理
            return false;
        });

    </script>
</body>
</html>
