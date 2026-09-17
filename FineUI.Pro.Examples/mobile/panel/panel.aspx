<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.panel.panel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" runat="server" ShowHeader="false" ShowBorder="false" Layout="Fit"
            BodyPadding="10px">
            <Toolbars>
                <f:Toolbar runat="server" Title="面板标题" HeaderStyle="true">
                </f:Toolbar>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" CssClass="f-state-default">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="按钮一" Size="Small" EnableDefaultState="false" ClickHandler="onButton1Click"></f:Button>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Button runat="server" Text="菜单按钮" Size="Small" EnableDefaultState="false" ShowMenuIcon="false">
                            <Menu runat="server">
                                <f:MenuButton Text="菜单一" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                                <f:MenuButton Text="菜单二" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                                <f:MenuButton Text="菜单三" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                                <f:MenuButton Text="菜单四" runat="server" ClickHandler="onMyMenuButtonClick"></f:MenuButton>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:ContentPanel ID="ContentPanel2" runat="server" ShowBorder="false" ShowHeader="false">
                    <p>
                        <a href="http://baike.baidu.com/view/3645.htm" target="_blank"><b>比尔·盖茨</b></a>
                    </p>
                    <p>
                        比尔·盖茨（Bill Gates），全名威廉·亨利·盖茨三世，简称比尔或盖茨。1955年10月28日出生于美国华盛顿州西雅图，13岁开始计算机编程设计，18岁考入哈佛大学，一年后从哈佛退学，1975年与好友保罗·艾伦一起创办了微软公司，比尔盖茨担任微软公司董事长、CEO和首席软件设计师。
                    </p>
                    <p>
                        比尔·盖茨1995-2007年连续13年成为《福布斯》全球富翁榜首富，连续20年成为《福布斯》美国富翁榜首富。
                    </p>
                </f:ContentPanel>
            </Items>
        </f:Panel>
    </form>
    <script>

        function onButton1Click(event) {
            F.alert('您点击了按钮一');
        }


        function onMyMenuButtonClick(event) {
            F.alert({
                message: '您点击了菜单项：' + this.getText(),
                header: false,
                buttonPlain: true
            });
        }

    </script>
</body>
</html>
