<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_hideonclick.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.menu_hideonclick" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .my-menutext,
        .my-menutext .f-menu-item-text {
            cursor: default;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelExample1" IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="300px" Title="面板" EnableCollapse="false" runat="server">
            <Toolbars>
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
                                <f:MenuText ID="MenuText1" runat="server" HideOnClick="false" CssClass="my-menutext" Text="管理学院">
                                    <Menu ID="Menu2" runat="server">
                                        <f:MenuHyperLink ID="MenuHyperLink3" runat="server" Target="_blank" NavigateUrl="http://is.ustc.edu.cn/" Text="工商管理系">
                                        </f:MenuHyperLink>
                                        <f:MenuHyperLink ID="MenuHyperLink4" runat="server" Target="_blank" NavigateUrl="http://stat.ustc.edu.cn/"
                                            Text="统计与金融系">
                                        </f:MenuHyperLink>
                                    </Menu>
                                </f:MenuText>
                                <f:MenuText ID="MenuText2" runat="server" HideOnClick="true" CssClass="my-menutext" Text="物理学院">
                                    <Menu ID="Menu3" runat="server">
                                        <f:MenuHyperLink ID="MenuHyperLink2" runat="server" Target="_blank" NavigateUrl="http://phys.ustc.edu.cn/" Text="物理系">
                                        </f:MenuHyperLink>
                                        <f:MenuHyperLink ID="MenuHyperLink5" runat="server" Target="_blank" NavigateUrl="http://astro.ustc.edu.cn/" Text="天文学系">
                                        </f:MenuHyperLink>
                                    </Menu>
                                </f:MenuText>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <br />

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示点击菜单文字后保留或关闭菜单的两种处理。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>比较点击后的菜单状态</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUniversityMenu").ClientID %>'
                        title="中国科学技术大学">中国科学技术大学</strong>，再展开其中的多级菜单。<br />结果：浏览器显示菜单及下级菜单；带链接的菜单项可按配置打开新页面。</li>
                <li>分别点击本页两个用于对照的文字菜单项。<br />结果：<code>HideOnClick</code> 为 <code>false</code> 的菜单项点击后仍保留菜单，为 <code>true</code> 的菜单项点击后关闭菜单。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>菜单项[管理学院]设置了<code>HideOnClick</code>=<code>false</code>，所以点击不会隐藏整个菜单；</li>
                <li>菜单项[物理学院]设置了<code>HideOnClick</code>=<code>true</code>，所以点击会隐藏整个菜单；</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>HideOnClick</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuText1").ClientID %>' title="第 1 个MenuText">第 1
                        个MenuText</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuText2").ClientID %>' title="第 2 个MenuText">第 2
                        个MenuText</strong>）：各组分别设为<code>false</code>、<code>true</code>，控制文字菜单项点击后是否关闭当前菜单。</li>
            </ul>
        </section>
    </template>
</body>
</html>
