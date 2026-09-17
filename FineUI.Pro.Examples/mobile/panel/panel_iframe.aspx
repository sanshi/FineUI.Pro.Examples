<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_iframe.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.panel.panel_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" runat="server" ShowHeader="false" ShowBorder="false"
            EnableIFrame="true" IFrameUrl="~/mobile/button/button.aspx">
            <Toolbars>
                <f:Toolbar ID="Toolbar2" Title="面板（IFrame）" runat="server" HeaderStyle="true">
                </f:Toolbar>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" CssClass="f-state-default">
                    <Items>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Button runat="server" Text="转到其他页面" Size="Small" EnableDefaultState="false" ShowMenuIcon="false">
                            <Menu runat="server">
                                <f:MenuButton Text="首页" AttributeDataTag="../button/button.aspx" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                                <f:MenuButton Text="按钮分组" AttributeDataTag="../button/buttongroup.aspx" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                                <f:MenuButton Text="按钮分组（垂直）" AttributeDataTag="../button/buttongroup_vertical.aspx" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                                <f:MenuButton Text="按钮分组（与选项卡交互）" AttributeDataTag="../button/buttongroup_tabstrip.aspx" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script>

        var panel1ClientID = '<%= Panel1.ClientID %>';

        function onMyMenuButtonClick(event) {
            var iframeUrl = this.getAttr('data-tag');
            F(panel1ClientID).setIFrameUrl(iframeUrl);
        }

    </script>
</body>
</html>
