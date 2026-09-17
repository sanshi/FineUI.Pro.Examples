<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jscontrolpage.aspx.cs" Inherits="FineUI.Pro.Examples.usercontrol.jscontrolpage" %>

<%@ Register Src="JSControl.ascx" TagName="JSControl" TagPrefix="uc1" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/usercontrol/JSControl.ascx;~/usercontrol/jscontrol.js" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <f:Panel runat="server" ID="Panel4" IsFluid="true" EnableCollapse="false"
            Height="400px" Layout="VBox" BoxConfigAlign="Stretch" BoxConfigPosition="Start"
            BodyPadding="10px" BoxConfigChildMargin="0 0 5 0" Title="面板一">
            <Items>
                <f:UserControlConnector ID="UserControlConnector4" runat="server">
                    <uc1:JSControl ID="UserInfoControl4" UserName="陈萍萍" UserAge="20" UserCountry="合肥"
                        runat="server" />
                    <uc1:JSControl ID="UserInfoControl5" UserName="胡斐" UserAge="22" UserCountry="驻马店" Margin="0" BoxFlex="1"
                        runat="server" />
                </f:UserControlConnector>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
