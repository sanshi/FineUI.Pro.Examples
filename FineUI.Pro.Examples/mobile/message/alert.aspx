<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.message.alert" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox"
            BoxConfigChildMargin="0 0 10px 0" BodyPadding="10px" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="提示对话框" runat="server" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Button Text="提示对话框" runat="server" ID="Button1" OnClick="Button1_Click">
                </f:Button>
                <f:Button Text="提示对话框（ButtonFill）" runat="server" ID="Button2" OnClick="Button2_Click">
                </f:Button>
                <f:Button Text="提示对话框（ButtonPlain）" runat="server" ID="Button3" OnClick="Button3_Click">
                </f:Button>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
