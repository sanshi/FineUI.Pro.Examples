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
            <f:MenuHyperLink ID="MenuHyperLink1" runat="server" Icon="TagGreen" Target="_blank" NavigateUrl="http://scms.ustc.edu.cn/" Text="化学与材料科学学院">
            </f:MenuHyperLink>
            <f:MenuButton ID="MenuButton1" runat="server" Icon="TagBlue" Text="管理学院">
                <Menu ID="Menu2" runat="server">
                    <f:MenuHyperLink ID="MenuHyperLink3" runat="server" Icon="TagPink" Target="_blank" NavigateUrl="http://is.ustc.edu.cn/" Text="工商管理系">
                    </f:MenuHyperLink>
                    <f:MenuHyperLink ID="MenuHyperLink4" runat="server" Icon="TagPurple" Target="_blank" NavigateUrl="http://stat.ustc.edu.cn/" Text="统计与金融系">
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示两个菜单按钮通过同一个菜单标识共用菜单内容。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>从两个按钮打开同一个菜单</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= Menu1.ClientID %>" title="菜单">第一个菜单</strong>按钮，关闭菜单后再点击另一个。<br />
                    结果：两个按钮打开同一个菜单实例，菜单项内容统一维护。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>MenuID</code>（<strong class="example-control-reference" data-example-control="<%= btnMenu.ClientID %>"
                        title="中国科学技术大学">中国科学技术大学</strong>、<strong class="example-control-reference" data-example-control="<%= Button1.ClientID %>"
                        title="中国科学技术大学（和上一个按钮共享同一个菜单）">中国科学技术大学（和上一个按钮共享同一个菜单）</strong>）：两个按钮都引用 <code>Menu1</code>，共享菜单内容。</li>
            </ul>
        </section>
    </template>
</body>
</html>
