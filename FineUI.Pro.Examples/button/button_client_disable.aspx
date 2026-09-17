<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_client_disable.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_client_disable" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnChangeEnable" Text="按钮（单击后禁用所有按钮）" runat="server" OnClick="btnChangeEnable_Click" ClickHandler="onDisableButtonsClick"></f:Button>
        <br />
        <br />
        <f:Button ID="btnNormal" Text="普通按钮" runat="server" CssClass="marginr" />
        <f:Button ID="btnMedium" Text="中等大小按钮" runat="server" Size="Medium"
            CssClass="marginr" />
        <f:Button ID="btnLarge" Text="大按钮" runat="server" Size="Large" />

    </form>

    <script>

        var btnChangeEnableClientID = '<%= btnChangeEnable.ClientID %>';
        var btnNormalClientID = '<%= btnNormal.ClientID %>';
        var btnMediumClientID = '<%= btnMedium.ClientID %>';
        var btnLargeClientID = '<%= btnLarge.ClientID %>';

        function onDisableButtonsClick(event) {
            F(btnChangeEnableClientID).disable();
            F(btnNormalClientID).disable();
            F(btnMediumClientID).disable();
            F(btnLargeClientID).disable();
        }

    </script>
</body>
</html>
