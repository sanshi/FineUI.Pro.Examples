<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="server_error.aspx.cs" Inherits="FineUI.Pro.Examples.other.server_error" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button5" runat="server" OnClick="Button5_Click"
            Text="服务器异常（500）">
        </f:Button>
        <br />
        <br />
    </form>
</body>
</html>
