<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_autoheight_stretch.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox_autoheight_stretch" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false"
            Layout="HBox" BodyPadding="10px"
            BoxConfigChildMargin="0 5 0 0" BoxConfigLastChildMargin="0" ShowHeader="true" Title="面板（Layout=HBox）（默认值：BoxConfigAlign=Stretch）">
            <Items>
                <f:Panel ID="Panel7" Title="面板1" Width="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel8" Title="面板2" Width="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label6" runat="server" EncodeText="false" Text="Width=200px<br><br><br><br><br><br><br><br>bottom line">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel13" Title="面板3" BoxFlex="1"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label9" runat="server" EncodeText="false" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false"
            Layout="HBox" BodyPadding="10px"
            BoxConfigChildMargin="0 5 0 0" BoxConfigLastChildMargin="0" ShowHeader="true" Title="面板（Layout=HBox）（默认值：BoxConfigAlign=Stretch）">
            <Items>
                <f:Panel ID="Panel2" Title="面板1" Width="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" Title="面板2" Width="200px" Height="250px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label2" runat="server" EncodeText="false" Text="Width=200px Height=250px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel14" Title="面板3" BoxFlex="1"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label10" runat="server" EncodeText="false" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel10" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false"
            Layout="HBox" BodyPadding="10px" BoxConfigAlign="Start"
            BoxConfigChildMargin="0 5 0 0" BoxConfigLastChildMargin="0" ShowHeader="true" Title="面板（Layout=HBox BoxConfigAlign=Start）">
            <Items>
                <f:Panel ID="Panel11" Title="面板1" Width="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label7" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel12" Title="面板2" Width="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label8" runat="server" EncodeText="false" Text="Width=200px<br><br><br><br><br><br><br><br>bottom line">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel15" Title="面板3" BoxFlex="1"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label11" runat="server" EncodeText="false" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />
        <f:Panel ID="Panel4" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false"
            Layout="HBox" BoxConfigAlign="Start" BodyPadding="10px"
            BoxConfigChildMargin="0 5 0 0" BoxConfigLastChildMargin="0" ShowHeader="true" Title="面板（Layout=HBox BoxConfigAlign=Start）">
            <Items>
                <f:Panel ID="Panel6" Title="面板1" Width="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="Width=200px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel9" Title="面板2" Width="200px" Height="250px"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label4" runat="server" EncodeText="false" Text="Width=200px Height=250px">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel16" Title="面板3" BoxFlex="1"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label12" runat="server" EncodeText="false" Text="BoxFlex=1">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

    </form>
</body>
</html>
