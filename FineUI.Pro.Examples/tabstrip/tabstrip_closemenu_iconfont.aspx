<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_closemenu_iconfont.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_closemenu_iconfont" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" EnableTabCloseMenu="true"
            ShowBorder="true" ActiveTabIndex="1" runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" EnableClose="false" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="标签一中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="标签二" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="标签二中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" Title="标签三" Hidden="true" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="标签三中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab4" Title="标签四" BodyPadding="10px" EnableClose="true" runat="server">
                    <Items>
                        <f:Label ID="Label2" Text="标签四中的文本" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab5" EnableClose="true" Title="标签五" BodyPadding="10px" runat="server">
                    <Items>
                        <f:Label ID="Label1" Text="标签五中的文本" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />
        <f:Button ID="btnShowInClient" Text="显示标签三（客户端代码）" CssClass="marginr"
 runat="server" ClickHandler="onShowInClientClick">
        </f:Button>
        <f:Button ID="btnHideInClient" Text="隐藏标签三（客户端代码）" runat="server" ClickHandler="onHideInClientClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowInServer" Text="显示标签三（服务端代码）" CssClass="marginr"
            runat="server" OnClick="btnShowInServer_Click">
        </f:Button>
        <f:Button ID="btnHideInServer" Text="隐藏标签三（服务端代码）" runat="server" OnClick="btnHideInServer_Click">
        </f:Button>
        <br />
        <br />
        <br />
        注：在选项卡上点击鼠标右键，会看到为菜单项新增的图标字体。
    </form>
    <script>
        var Tab3ClientID = '<%= Tab3.ClientID %>';

        function onShowInClientClick(event) {
            F(Tab3ClientID).show();
        }

        function onHideInClientClick(event) {
            F(Tab3ClientID).hide();
        }

        var tabStripClientID = '<%= TabStrip1.ClientID %>';

        F.ready(function () {

            var closeMenu = F(tabStripClientID).getCloseMenu();

            $.each(closeMenu.items, function (index, item) {
                if (item.isType('MenuItem')) {
                    if (item.el.hasClass('f-tabstrip-tabmenu-close')) {
                        item.setIconFont('f-icon-close');
                    } else if (item.el.hasClass('f-tabstrip-tabmenu-close-others')) {
                        item.setIconFont('f-icon-trash-o');
                    } else if (item.el.hasClass('f-tabstrip-tabmenu-close-all')) {
                        //item.setIconFont('f-icon-trash');
                        item.setIcon('/res/icon/system_close.gif');
                    }
                }
            });
        });
    </script>
</body>
</html>
