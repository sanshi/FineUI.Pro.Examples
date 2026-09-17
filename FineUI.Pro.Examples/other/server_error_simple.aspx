<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="server_error_simple.aspx.cs" Inherits="FineUI.Pro.Examples.other.server_error_simple" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" SimpleError="true" runat="server" />
        <f:Button ID="Button5" runat="server" OnClick="Button5_Click"
            Text="服务器异常（500）">
        </f:Button>
        <br />
        <br />
        注：本示例仅作演示，实际应用中请在Web.config中增加SimpleError配置项，以便在整个项目中保持统一。
    </form>
</body>
</html>
