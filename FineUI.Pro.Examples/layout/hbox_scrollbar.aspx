<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_scrollbar.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox_scrollbar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel5" runat="server" />
        <f:Panel ID="Panel5" Margin="24px" runat="server" ShowBorder="true" EnableCollapse="false"
            Layout="HBox" AutoScroll="true"
            ShowHeader="true" Title="面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条"
            BoxConfigChildMargin="0 5 0 0" BodyPadding="5">
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
                        <f:Label ID="Label3" runat="server" Text="BoxFlex=1 Margin=0 MinWidth=600">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

    </form>
</body>
</html>
