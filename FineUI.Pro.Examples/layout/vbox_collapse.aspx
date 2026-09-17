<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_collapse.aspx.cs" Inherits="FineUI.Pro.Examples.layout.vbox_collapse" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="550px" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" BoxConfigChildMargin="0 0 5 0" BodyPadding="10px"
            ShowHeader="true" Title="面板（Layout=VBox）">
            <Items>
                <f:Panel ID="Panel3" Title="面板1" Height="120px" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="Height=120px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel1" Title="面板2" BoxFlex="1" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" Title="面板3" BoxFlex="2" Margin="0"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="true" EnableCollapse="true">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="BoxFlex=2 Margin=0">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
