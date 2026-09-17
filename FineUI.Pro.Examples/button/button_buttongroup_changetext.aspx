<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_buttongroup_changetext.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_buttongroup_changetext" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="300px" Title="面板" runat="server">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:ButtonGroup ID="ButtonGroup1" runat="server">
                            <f:Button ID="Button1" Text="按钮一" IconAlign="Top" Icon="Email" runat="server" />
                            <f:Button ID="Button2" Text="按钮二" IconAlign="Bottom" Icon="Star" runat="server" />
                            <f:Button ID="Button3" Text="按钮三" IconAlign="Top" IconFont="_Camera" runat="server" />
                            <f:Button ID="Button4" Text="按钮四" IconAlign="Bottom" IconFont="_Phone" runat="server" />
                        </f:ButtonGroup>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Button runat="server" CssClass="marginr" ID="btnChangeButtonText" Text="修改[按钮四]的文本" OnClick="btnChangeButtonText_Click"></f:Button>
                <f:Button runat="server" ID="btnShowHideButton" Text="显示隐藏[按钮四]" OnClick="btnShowHideButton_Click"></f:Button>
            </Items>
        </f:Panel>
        <br />
        <f:ButtonGroup ID="ButtonGroup2" runat="server">
            <f:Button ID="Button5" Text="按钮五" IconAlign="Top" Icon="Email" runat="server" />
            <f:Button ID="Button6" Text="按钮六" IconAlign="Bottom" Icon="Star" runat="server" />
            <f:Button ID="Button7" Text="按钮七" IconAlign="Top" IconFont="_Camera" runat="server" />
            <f:Button ID="Button8" Text="按钮八" IconAlign="Bottom" IconFont="_Phone" runat="server" />
        </f:ButtonGroup>
        <br />
        <f:Button runat="server" CssClass="marginr" ID="btnChangeButtonText2" Text="修改[按钮八]的文本" OnClick="btnChangeButtonText2_Click"></f:Button>
        <f:Button runat="server" ID="btnShowHideButton2" Text="显示隐藏[按钮八]" OnClick="btnShowHideButton2_Click"></f:Button>
    </form>
</body>
</html>
