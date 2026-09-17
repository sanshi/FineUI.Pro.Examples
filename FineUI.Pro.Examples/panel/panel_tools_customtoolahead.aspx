<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_tools_customtoolahead.aspx.cs" Inherits="FineUI.Pro.Examples.panel.panel_tools_customtoolahead" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Title="面板" Height="350px"
            BodyPadding="10px" EnableCollapse="true" IconUrl="~/res/images/16/8.png" CustomToolAhead="true">
            <Items>
                <f:Label runat="server" Text="面板内容"></f:Label>
            </Items>
            <Tools>
                <f:Tool ID="Tool4" runat="server" IconFont="_Save" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool18" runat="server" IconFont="_Plus" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool10" runat="server" IconFont="_Edit" ClickHandler="onToolIconClick"></f:Tool>
                <f:Tool ID="Tool5" runat="server" IconFont="_Minus" ClickHandler="onToolIconClick"></f:Tool>
            </Tools>
        </f:Panel>
        <br />
        <f:Button ID="Button2" CssClass="marginr" Text="检查面板的折叠状态" runat="server" OnClick="Button2_Click">
        </f:Button>
    </form>
    <script>

        function onToolIconClick(event) {
            // 当前点击的图标字体
            var iconFont = this.iconFont;
            var text = this.text;

            F.notify({
                message: '你点击了标题栏工具图标：' + iconFont,
                messageIconFont: iconFont,
                displayMilliseconds: 3000,
                positionX: 'center',
                positionY: 'center'
            });
        }

    </script>
</body>
</html>
