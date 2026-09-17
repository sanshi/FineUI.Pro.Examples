<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_menu_menuid.aspx.cs" Inherits="FineUI.Pro.Examples.button.button_menu_menuid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Menu ID="Menu1" runat="server">
            <f:MenuHyperLink ID="MenuHyperLink1" runat="server" Icon="TagGreen" Target="_blank" NavigateUrl="http://scms.ustc.edu.cn/"
                Text="化学与材料科学学院">
            </f:MenuHyperLink>
            <f:MenuButton ID="MenuButton1" runat="server" Icon="TagBlue" Text="管理学院">
                <Menu ID="Menu2" runat="server">
                    <f:MenuHyperLink ID="MenuHyperLink3" runat="server" Icon="TagPink" Target="_blank" NavigateUrl="http://is.ustc.edu.cn/"
                        Text="工商管理系">
                    </f:MenuHyperLink>
                    <f:MenuHyperLink ID="MenuHyperLink4" runat="server" Icon="TagPurple" Target="_blank" NavigateUrl="http://stat.ustc.edu.cn/"
                        Text="统计与金融系">
                    </f:MenuHyperLink>
                </Menu>
            </f:MenuButton>
        </f:Menu>

        <f:Button ID="btnMenu" Text="中国科学技术大学" runat="server" MenuID="Menu1">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button1" Text="中国科学技术大学（和上一个按钮共享同一个菜单）" MenuID="Menu1" runat="server">
        </f:Button>

        <br />
        <br />
    </form>
</body>
</html>
