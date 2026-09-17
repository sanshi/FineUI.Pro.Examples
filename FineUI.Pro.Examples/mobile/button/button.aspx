<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.button.button" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigChildMargin="0 0 5px 0" BodyPadding="10px" AutoScroll="true" runat="server">
            <Items>
                <f:Button ID="Button1" Text="普通按钮" runat="server" />
                <f:Button ID="Button2" Text="按下按钮" runat="server" EnablePress="true" Pressed="true" />
                <f:Button ID="Button3" Text="禁用按钮" Enabled="false" runat="server" MarginBottom="30px" />
                <f:Panel runat="server" ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigChildMargin="0 5px 0 0" MarginBottom="30px">
                    <Items>
                        <f:Button ID="Button4" Text="普通按钮" BoxFlex="1" runat="server" />
                        <f:Button ID="Button5" Text="按下按钮" BoxFlex="1" runat="server" EnablePress="true" Pressed="true" />
                        <f:Button ID="Button6" Text="禁用按钮" BoxFlex="1" Enabled="false" runat="server" Margin="0" />
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" runat="server" ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigChildMargin="0 5px 0 0" MarginBottom="30px">
                    <Items>
                        <f:Button ID="Button7" Text="普通按钮" BoxFlex="1" Icon="Star" IconAlign="Top" runat="server" />
                        <f:Button ID="Button8" Text="按下按钮" BoxFlex="1" IconFont="_Mail" IconAlign="Top" runat="server" EnablePress="true" Pressed="true" />
                        <f:Button ID="Button9" Text="禁用按钮" BoxFlex="1" IconFont="_Refresh" IconAlign="Top" Enabled="false" runat="server" Margin="0" />
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
