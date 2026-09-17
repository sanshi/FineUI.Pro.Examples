<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userinfo.aspx.cs" Inherits="FineUI.Pro.Examples.usercontrol.userinfo" %>

<%@ Register Src="UserInfoControl.ascx" TagName="UserInfoControl" TagPrefix="uc1" %>
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
            <uc1:UserInfoControl ID="UserInfoControl1" UserName="陈萍萍" UserAge="20" UserCountry="合肥"
                runat="server" />
        </f:ContentPanel>
        <br />
        <f:Panel runat="server" ID="Panel2" IsFluid="true" Height="200px" EnableCollapse="false" BodyPadding="10px"
            Title="面板二（Panel->UserControlConnector->UserInfoControl）">
            <Items>
                <f:UserControlConnector runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl2" UserName="陈萍萍" UserAge="20" UserCountry="合肥"
                        runat="server" />
                </f:UserControlConnector>
            </Items>
        </f:Panel>
        <br />
        <f:Panel runat="server" ID="Panel3" IsFluid="true" Height="200px" EnableCollapse="false" BodyPadding="10px"
            Layout="Fit" Title="面板三（Layout=Fit, Panel->UserControlConnector->UserInfoControl）">
            <Items>
                <f:UserControlConnector runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl3" UserName="陈萍萍" UserAge="20" UserCountry="合肥"
                        runat="server" />
                </f:UserControlConnector>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
