<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userinfo_dynamic.aspx.cs"
    Inherits="FineUI.Pro.Examples.usercontrol.userinfo_dynamic" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/usercontrol/UserInfoControl.ascx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <f:ContentPanel runat="server" ID="Panel1" IsFluid="true" EnableCollapse="false" BodyPadding="10px"
            Height="200px" Title="面板一（ContentPanel->UserInfoControl）">
        </f:ContentPanel>
        <br />
        <f:Panel runat="server" ID="Panel2" IsFluid="true" EnableCollapse="false" BodyPadding="10px"
            Height="200px" Title="面板二（Panel->UserControlConnector->UserInfoControl）">
        </f:Panel>
        <br />
        <f:Panel runat="server" ID="Panel3" IsFluid="true" EnableCollapse="false" BodyPadding="10px"
            Height="200px" Layout="Fit" Title="面板三（Layout=Fit, Panel->UserControlConnector->UserInfoControl）">
        </f:Panel>
    </form>
</body>
</html>
