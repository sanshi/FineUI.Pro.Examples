<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_redirect.aspx.cs" Inherits="FineUI.Pro.Examples.message.alert_redirect" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="弹出提示对话框" ID="Button1" runat="server" ClickHandler="onAlertAndRedirectClick">
        </f:Button>
        <br />
        <br />
        <f:Button Text="弹出提示对话框（服务器端）" ID="Button2" runat="server" OnClick="Button2_Click">
        </f:Button>
    </form>
    <script>

        function alertAndRedirect(message, redirectUrl) {
            F.alert({
                message: message,
                ok: function () {
                    window.location.href = redirectUrl;
                }
            });
        }

        function onAlertAndRedirectClick(event) {
            alertAndRedirect('点击确定后跳转页面', './alert.aspx');
        }

    </script>
</body>
</html>
