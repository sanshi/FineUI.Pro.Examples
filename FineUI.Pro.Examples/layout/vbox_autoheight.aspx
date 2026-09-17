<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_autoheight.aspx.cs" Inherits="FineUI.Pro.Examples.layout.vbox_autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="true"
            Layout="VBox" ShowHeader="true" Title="面板（Layout=VBox）（默认值：BoxConfigAlign=Stretch）"
            BoxConfigChildMargin="0 0 5 0" BodyPadding="5">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" Height="100px" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Height=100">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" Title="面板2" Margin="0"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" EncodeText="false" Text="Margin=0<br><br><br><br><br><br>bottom line">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />

    </form>
</body>
</html>
