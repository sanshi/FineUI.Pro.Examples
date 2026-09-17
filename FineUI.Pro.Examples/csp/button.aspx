<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button.aspx.cs" Inherits="FineUI.Pro.Examples.csp.button" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Button/Button</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" CspScripts="true" CspScriptsAllowNonce="true" runat="server" />

        <f:Button Text="缺省按钮" CssClass="marginr" runat="server" />
        <f:Button ID="btnPrimary" Text="主按钮" ButtonColor="Primary" runat="server" />
        <br />
        <br />
        <f:Button ID="btnChangeEnable" Text="启用后面的按钮" OnClick="btnChangeEnable_Click" CssClass="marginr" runat="server" />
        <f:Button ID="btnEnable" Text="禁用的按钮" OnClick="btnEnable_Click" Enabled="false" runat="server" />
        <br />
        <br />
        <f:Button ID="btnChangePressed" Text="改变后面按钮的按下状态" OnClick="btnChangePressed_Click" CssClass="marginr" runat="server" />
        <f:Button ID="btnPressed" Text="按下的按钮" EnablePress="true" Pressed="true" runat="server" />
        <br />
        <br />
        <f:Button ID="btnTooltip" Text="这个按钮有提示信息（点击改变提示信息）" ToolTip="这是按钮的提示信息" OnClick="btnTooltip_Click" runat="server" />
        <br />
        <br />
        <br />
        <f:Button ID="Button4" Text="小按钮" Size="Small" CssClass="marginr" runat="server" />
        <f:Button ID="Button1" Text="普通按钮" CssClass="marginr" runat="server" />
        <f:Button ID="Button2" Text="中等按钮" Size="Medium" CssClass="marginr" runat="server" />
        <f:Button ID="Button3" Text="大按钮" Size="Large" runat="server" />
    </form>

    <script nonce="<%= PageManager.Instance.CspScriptsNonceValue %>" type="text/javascript">

        console.log('Hello world!');

    </script>
</body>
</html>
