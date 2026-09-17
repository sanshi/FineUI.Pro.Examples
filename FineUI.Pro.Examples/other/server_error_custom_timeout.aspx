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

        F.beforeAjaxError(function (data, textStatus) {
            
            if (textStatus === 'timeout') {
                showCenterNotify('AJAX请求超时！', 'error');
            }

            // 需要显式的返回 false，来阻止默认的错误处理
            return false;
        });

    </script>
</body>
</html>
