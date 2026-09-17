<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userinfo_layout.aspx.cs" Inherits="FineUI.Pro.Examples.usercontrol.userinfo_layout" %>

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
        <f:Panel runat="server" ID="Panel1" IsFluid="true" EnableCollapse="false"
            Height="300px" Layout="VBox"
            BodyPadding="10px" BoxConfigChildMargin="0 0 5 0" Title="面板一">
            <Items>
                <f:UserControlConnector ID="UserControlConnector1" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl1" UserName="陈萍萍" UserAge="20" UserCountry="合肥"
                        runat="server" />
                </f:UserControlConnector>
                <f:Panel runat="server" ID="Panel3" BodyPadding="10px" BoxFlex="1" Margin="0"
                    Title="面板二">
                    <Items>
                        <f:Label runat="server" Text="胡斐今年22岁，住在驻马店。">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <f:Panel runat="server" ID="Panel2" IsFluid="true" EnableCollapse="false"
            Height="300px" Layout="VBox"
            BodyPadding="10px" BoxConfigChildMargin="0 0 5 0" Title="面板三">
            <Items>
                <f:UserControlConnector ID="UserControlConnector2" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl2" UserName="陈萍萍" BoxFlex="1" UserAge="20" UserCountry="合肥"
                        runat="server" />
                </f:UserControlConnector>
                <f:UserControlConnector ID="UserControlConnector3" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl3" Margin="0" BoxFlex="1" UserName="胡斐" UserAge="22" UserCountry="驻马店"
                        runat="server" />
                </f:UserControlConnector>
            </Items>
        </f:Panel>
        <br />
        <f:Panel runat="server" ID="Panel5" IsFluid="true" EnableCollapse="false"
            Height="300px" Layout="HBox"
            BodyPadding="10px" BoxConfigChildMargin="0 5 0 0" Title="面板三">
            <Items>
                <f:UserControlConnector ID="UserControlConnector5" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl6" UserName="陈萍萍" BoxFlex="1" UserAge="20" UserCountry="合肥"
                        runat="server" />
                </f:UserControlConnector>
                <f:UserControlConnector ID="UserControlConnector6" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl7" Margin="0" BoxFlex="1" UserName="胡斐" UserAge="22" UserCountry="驻马店"
                        runat="server" />
                </f:UserControlConnector>
            </Items>
        </f:Panel>
        <br />
        <%--<f:Panel runat="server" ID="Panel4" IsFluid="true" EnableCollapse="false"
            Height="300px" Layout="VBox" BoxConfigAlign="Stretch" BoxConfigPosition="Start"
            BodyPadding="10px" BoxConfigChildMargin="0 0 5 0" Title="面板四">
            <Items>
                <f:UserControlConnector ID="UserControlConnector4" runat="server">
                    <uc1:UserInfoControl ID="UserInfoControl4" UserName="陈萍萍" UserAge="20" UserCountry="合肥"
                        runat="server" />
                    <uc1:UserInfoControl ID="UserInfoControl5" UserName="胡斐" UserAge="22" UserCountry="驻马店" Margin="0" BoxFlex="1"
                        runat="server" />
                </f:UserControlConnector>
            </Items>
        </f:Panel>--%>
    </form>
</body>
</html>
