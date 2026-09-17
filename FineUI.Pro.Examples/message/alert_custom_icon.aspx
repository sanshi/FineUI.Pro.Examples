<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_custom_icon.aspx.cs" Inherits="FineUI.Pro.Examples.message.alert_custom_icon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="点击弹出对话框（Icon）" runat="server" ID="btnHello" OnClick="btnHello_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="在顶层窗口弹出对话框（IconUrl）" runat="server" ID="btnHello2" OnClick="btnHello2_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="在顶层窗口弹出对话框（IconFont）" runat="server" ID="btnHello3" OnClick="btnHello3_Click">
        </f:Button>
    </form>
</body>
</html>
