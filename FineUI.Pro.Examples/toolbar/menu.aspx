<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.menu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelExample1" IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="300px" Title="面板" EnableCollapse="false" runat="server">
            <toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:ToolbarText runat="server" Text="内联菜单">
                        </f:ToolbarText>
                        <f:ToolbarSeparator runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="btnUniversityMenu" Text="中国科学技术大学" runat="server">
                            <Menu ID="Menu1" runat="server">
                                <f:MenuHyperLink ID="MenuHyperLink1" runat="server" Target="_blank" NavigateUrl="http://scms.ustc.edu.cn/" Text="化学与材料科学学院">
                                </f:MenuHyperLink>
                                <f:MenuHyperLink ID="MenuHyperLink2" runat="server" Target="_blank" NavigateUrl="http://business.ustc.edu.cn/zh_CN/"
                                    Text="管理学院">
                                    <Menu ID="Menu2" runat="server">
                                        <f:MenuHyperLink ID="MenuHyperLink3" runat="server" Target="_blank" NavigateUrl="http://is.ustc.edu.cn/" Text="工商管理系">
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示工具栏按钮展开多级菜单，并由链接菜单项打开目标页面。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>打开多级菜单</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUniversityMenu").ClientID %>'
                        title="中国科学技术大学">中国科学技术大学</strong>，再展开其中的多级菜单。<br />结果：浏览器显示菜单及下级菜单；带链接的菜单项可按配置打开新页面。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Menu</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUniversityMenu").ClientID %>'
                        title="中国科学技术大学">中国科学技术大学</strong>）：给工具栏按钮配置下拉菜单。</li>
                <li><code>NavigateUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuHyperLink1").ClientID %>' title="第 1 个菜单链接">第 1 个菜单链接</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuHyperLink2").ClientID %>'
                        title="第 2 个菜单链接">第 2 个菜单链接</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuHyperLink3").ClientID %>' title="第 3 个菜单链接">第 3 个菜单链接</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuHyperLink4").ClientID %>'
                        title="第 4 个菜单链接">第 4
                        个菜单链接</strong>）：各组分别设为<code>http://scms.ustc.edu.cn/</code>、<code>http://business.ustc.edu.cn/zh_CN/</code>、<code>http://is.ustc.edu.cn/</code>、<code>http://stat.ustc.edu.cn/</code>，指定链接菜单项打开的页面。
                </li>
                <li><code>Target</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuHyperLink1").ClientID %>' title="第 1 个菜单链接">第 1 个菜单链接</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuHyperLink2").ClientID %>'
                        title="第 2 个菜单链接">第 2 个菜单链接</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuHyperLink3").ClientID %>' title="第 3 个菜单链接">第 3 个菜单链接</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuHyperLink4").ClientID %>'
                        title="第 4 个菜单链接">第 4 个菜单链接</strong>）：初始为<code>_blank</code>，本页链接在新页面打开。</li>
            </ul>
        </section>
    </template>
</body>
</html>
