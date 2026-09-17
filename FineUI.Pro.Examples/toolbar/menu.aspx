<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.menu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="300px" Title="面板" EnableCollapse="false"
            runat="server">
            <toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:ToolbarText runat="server" Text="内联菜单">
                        </f:ToolbarText>
                        <f:ToolbarSeparator runat="server">
                        </f:ToolbarSeparator>
                        <f:Button Text="中国科学技术大学" runat="server">
                            <Menu ID="Menu1" runat="server">
                                <f:MenuHyperLink ID="MenuHyperLink1" runat="server" Target="_blank" NavigateUrl="http://scms.ustc.edu.cn/"
                                    Text="化学与材料科学学院">
                                </f:MenuHyperLink>
                                <f:MenuHyperLink ID="MenuHyperLink2" runat="server" Target="_blank" NavigateUrl="http://business.ustc.edu.cn/zh_CN/"
                                    Text="管理学院">
                                    <Menu ID="Menu2" runat="server">
                                        <f:MenuHyperLink ID="MenuHyperLink3" runat="server" Target="_blank" NavigateUrl="http://is.ustc.edu.cn/"
                                            Text="工商管理系">
                                        </f:MenuHyperLink>
                                        <f:MenuHyperLink ID="MenuHyperLink4" runat="server" Target="_blank" NavigateUrl="http://stat.ustc.edu.cn/"
                                            Text="统计与金融系">
                                        </f:MenuHyperLink>
                                    </Menu>
                                </f:MenuHyperLink>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </toolbars>
        </f:Panel>

    </form>
</body>
</html>
