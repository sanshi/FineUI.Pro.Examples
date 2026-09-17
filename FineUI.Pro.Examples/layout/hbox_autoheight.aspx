<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_autoheight.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox_autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false"
            Layout="HBox"  AutoScroll="true"
            ShowHeader="true" Title="面板（Layout=HBox AutoScroll=true）"
            BoxConfigChildMargin="0 5 0 0" BodyPadding="5" >
            <Items>
                <f:Panel ID="Panel1" Title="面板1" Width="600px" runat="server"
                    BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Width=600">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" Title="面板2" BoxFlex="1" MinWidth="600px" Margin="0"
                    runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" EncodeText="false" Text="BoxFlex=1<br>Margin=0<br>MinWidth=600<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>bottom line">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

    </form>
</body>
</html>
