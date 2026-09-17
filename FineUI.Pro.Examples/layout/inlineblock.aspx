<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inlineblock.aspx.cs" Inherits="FineUI.Pro.Examples.layout.inlineblock" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mypanel {
            display: inline-block;
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" Margin="24px" runat="server" ShowBorder="true" EnableCollapse="false"
            BodyPadding="10px" ShowHeader="true" Title="面板" AutoScroll="true">
            <Items>
                <f:Panel ID="Panel2" Title="面板1" CssClass="mypanel" Width="300px" Height="200px" runat="server"
                    BodyPadding="10px" ShowBorder="true">
                </f:Panel>
                <f:Panel ID="Panel3" Title="面板2" CssClass="mypanel" Width="300px" Height="200px" runat="server"
                    BodyPadding="10px" ShowBorder="true">
                </f:Panel>
                <f:Panel ID="Panel4" Title="面板3" CssClass="mypanel" Width="300px" Height="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true">
                </f:Panel>
                <f:Panel ID="Panel5" Title="面板4" CssClass="mypanel" Width="300px" Height="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true">
                </f:Panel>
                <f:Panel ID="Panel6" Title="面板5" CssClass="mypanel" Width="300px" Height="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true">
                </f:Panel>
                <f:Panel ID="Panel7" Title="面板6" CssClass="mypanel" Width="300px" Height="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true">
                </f:Panel>
                <f:Panel ID="Panel8" Title="面板7" CssClass="mypanel" Width="300px" Height="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true">
                </f:Panel>
                <f:Panel ID="Panel9" Title="面板8" CssClass="mypanel" Width="300px" Height="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true">
                </f:Panel>
                <f:Panel ID="Panel10" Title="面板9" CssClass="mypanel" Width="300px" Height="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true">
                </f:Panel>
                <f:Panel ID="Panel11" Title="面板10" CssClass="mypanel" Width="300px" Height="200px"
                    runat="server" BodyPadding="10px" ShowBorder="true">
                </f:Panel>
            </Items>
        </f:Panel>

    </form>
</body>
</html>
