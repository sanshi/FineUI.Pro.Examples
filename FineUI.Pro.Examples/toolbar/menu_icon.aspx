<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_icon.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.menu_icon" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelExample1" ClientIDMode="Static" IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="300px" Title="面板" EnableCollapse="false"
            runat="server">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:ToolbarText runat="server" Text="菜单项">
                        </f:ToolbarText>
                        <f:ToolbarSeparator runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="btnUniversityMenu" ClientIDMode="Static" Text="中国科学技术大学" runat="server">
                            <Menu ID="Menu1" runat="server">
                                <f:MenuHyperLink ID="MenuHyperLink1" runat="server" Target="_blank" NavigateUrl="http://scms.ustc.edu.cn/" Text="化学与材料科学学院"
                                    Icon="Accept">
                                </f:MenuHyperLink>
                                <f:MenuHyperLink ID="MenuHyperLink2" runat="server" Target="_blank" NavigateUrl="http://business.ustc.edu.cn/zh_CN/" Text="管理学院"
                                    Icon="Accept">
                                    <Menu runat="server">
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
            </Toolbars>
            <Items>
                <f:Button Text="删除[化学与材料科学学院]菜单项的图标" CssClass="marginr" ID="Button1" OnClick="Button1_Click" runat="server">
                </f:Button>
                <f:Button Text="修改[管理学院]菜单项的图标" ID="Button2" OnClick="Button2_Click" runat="server">
                </f:Button>
            </Items>
        </f:Panel>

    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示为菜单项配置图片图标，并在后台删除或更换指定图标。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>更新指定菜单项的图标</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUniversityMenu").ClientID %>'
                        title="中国科学技术大学">中国科学技术大学</strong>，再展开其中的多级菜单。<br />结果：浏览器显示菜单及下级菜单；带链接的菜单项可按配置打开新页面。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="删除[化学与材料科学学院]菜单项的图标">删除[化学与材料科学学院]菜单项的图标</strong>。<br />结果：后台移除指定菜单项图标，重新展开菜单即可对照。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="修改[管理学院]菜单项的图标">修改[管理学院]菜单项的图标</strong>。<br />结果：后台替换指定菜单项图标，菜单文字与链接保持原样。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Icon</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuHyperLink1").ClientID %>' title="第 1 个菜单链接">第 1 个菜单链接</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuHyperLink2").ClientID %>'
                        title="第 2 个菜单链接">第 2 个菜单链接</strong>）：初始为<code>Accept</code>，指定菜单项的图片图标；本页按钮只更新目标菜单项。</li>
            </ul>
        </section>
    </template>
</body>
</html>
