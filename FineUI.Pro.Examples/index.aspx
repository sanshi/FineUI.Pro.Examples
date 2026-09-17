<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FineUI.Pro.Examples.index" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>FineUI.Pro 在线示例 - .NET 企业级全栈 UI 框架</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <meta name="Title" content=".NET 企业级全栈 UI 框架" />
    <meta name="Description" content="FineUI 的使命是创建 No JavaScript，No CSS，No UpdatePanel，No ViewState 的网站应用程序" />
    <meta name="Keywords" content="jQuery,jQueryUI,FineUI,ASP.NET,控件库,AJAX,Web2.0" />

    <asp:Literal ID="litDynamicCSS" runat="server" />
    <link type="text/css" rel="stylesheet" id="linkIndexCSS" runat="server" href="~/res/css/index.css" />
    <link type="text/css" rel="stylesheet" id="linkMobileViewCss" runat="server" href="~/res/css/mobileview.css" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="mainPanel" runat="server"></f:PageManager>
        <f:Panel ID="mainPanel" Layout="Region" CssClass="mainpanel" ShowBorder="false" ShowHeader="false" runat="server" EnableDefaultCorner="false">
            <Items>
                <f:Panel ID="sidebarRegion" CssClass="sidebarregion" RegionPosition="Left"
                    ShowBorder="false" ShowHeader="false"
                    EnableCollapse="false" Collapsed="false" Layout="VBox" runat="server"
                    RegionSplit="true" RegionSplitIcon="false" RegionSplitWidth="3" RegionSplitTransparent="true">
                    <Items>
                        <f:ContentPanel CssClass="topregion" ShowBorder="false" ShowHeader="false" runat="server">
                            <div id="sideheader" class="f-widget-header f-mainheader">
                                <a class="logo-img f-widget-header" href="./">
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewBox="0 0 512 512">
                                        <path fill="currentColor" opacity="0.9" fill-rule="evenodd" d="M498.526 215.579h-4.58c-22.829-0.196-42.295-14.382-50.262-34.394l-0.13-0.369-1.617-4.042c-2.978-6.535-4.714-14.172-4.714-22.214 0-14.908 5.964-28.424 15.636-38.291l3.225-3.225c2.421-2.436 3.918-5.792 3.918-9.499s-1.497-7.064-3.919-9.5l0 0.001-38.4-38.13c-2.436-2.421-5.792-3.919-9.5-3.919s-7.063 1.497-9.5 3.919l-3.233 3.233c-9.859 9.663-23.373 15.627-38.282 15.627-8.043 0-15.68-1.736-22.558-4.853l0.344 0.14-4.043-1.617c-20.268-8.177-34.341-27.621-34.492-50.373v-4.6c0-7.441-6.032-13.473-13.474-13.473v0h-53.894c-7.441 0-13.474 6.032-13.474 13.473v0 4.58c-0.196 22.828-14.382 42.295-34.394 50.262l-0.369 0.129-4.042 1.617c-6.535 2.978-14.172 4.713-22.214 4.713-14.908 0-28.424-5.964-38.291-15.636l-3.225-3.225c-2.436-2.421-5.792-3.919-9.499-3.919s-7.064 1.497-9.5 3.919l0.001-0.001-38.13 38.4c-2.421 2.436-3.919 5.792-3.919 9.499s1.497 7.064 3.919 9.5l3.233 3.233c9.663 9.859 15.627 23.373 15.627 38.282 0 8.043-1.736 15.68-4.853 22.559l0.14-0.344-1.617 4.042c-8.177 20.268-27.621 34.341-50.373 34.492h-4.6c-7.441 0-13.473 6.032-13.473 13.474v0 53.894c0 7.442 6.032 13.474 13.473 13.474v0h4.58c22.828 0.197 42.295 14.382 50.262 34.394l0.129 0.369 1.617 4.043c2.978 6.534 4.713 14.172 4.713 22.214 0 14.908-5.964 28.425-15.636 38.291l-3.225 3.225c-2.421 2.436-3.919 5.792-3.919 9.5s1.497 7.063 3.919 9.5l-0.001-0 38.4 38.13c2.436 2.421 5.792 3.918 9.499 3.918s7.064-1.497 9.5-3.919l3.233-3.233c9.859-9.663 23.373-15.627 38.282-15.627 8.043 0 15.68 1.736 22.559 4.853l-0.344-0.14 4.042 1.617c20.268 8.177 34.341 27.622 34.492 50.373v4.6c0 7.442 6.032 13.474 13.474 13.474h53.894c7.442 0 13.474-6.032 13.474-13.474v0-4.58c0.197-22.829 14.382-42.295 34.394-50.262l0.369-0.13 4.043-1.617c6.534-2.978 14.172-4.714 22.214-4.714 14.908 0 28.425 5.964 38.291 15.636l3.225 3.225c2.436 2.421 5.792 3.918 9.5 3.918s7.063-1.497 9.5-3.919l-0 0 38.13-38.4c2.421-2.436 3.918-5.792 3.918-9.5s-1.497-7.063-3.919-9.5l-3.233-3.233c-9.663-9.859-15.627-23.373-15.627-38.282 0-8.043 1.736-15.68 4.853-22.558l-0.14 0.344 1.617-4.043c8.177-20.268 27.622-34.341 50.373-34.492h4.6c7.442 0 13.473-6.032 13.473-13.474v0-53.894c0-7.441-6.032-13.474-13.474-13.474v0z M256 107.79c81.854 0 148.21 66.356 148.21 148.21s-66.356 148.21-148.21 148.21S107.79 337.854 107.79 256 174.146 107.79 256 107.79z">
                                        </path>
                                        <path fill="currentColor" opacity="0.6" fill-rule="evenodd" d="M256.002 107.79c-81.854 0-148.21 66.356-148.21 148.21s66.356 148.21 148.21 148.21c81.854 0 148.21-66.356 148.21-148.21v0c0-81.854-66.356-148.21-148.21-148.21v0z M256.002 323.369c-37.206 0-67.369-30.161-67.369-67.369s30.161-67.369 67.369-67.369c37.206 0 67.369 30.161 67.369 67.369v0c0 37.206-30.161 67.369-67.369 67.369v0z"></path>
                                    </svg>
                                </a>
                                <a class="logo f-widget-header" href="./" title="FineUI.Pro" id="logoTitle" runat="server">FineUI.Pro</a>
                                <div class="logo-subtitle">WebForms</div>
                            </div>
                        </f:ContentPanel>
                        <f:Panel ID="leftPanel" CssClass="leftregion" BoxFlex="1" ShowBorder="false" ShowHeader="false" Layout="Fit" runat="server">
                            <Items>
                                <f:Tree ID="treeMenu" ShowBorder="false" ShowHeader="false" EnableSingleClickExpand="true"
                                    HideHScrollbar="true" HideVScrollbar="true" ExpanderToRight="true" HeaderStyle="true" AllHeaderStyle="true" runat="server">
                                </f:Tree>
                            </Items>
                        </f:Panel>
                    </Items>
                    <Listeners>
                        <f:Listener Event="splitdrag" Handler="onSidebarSplitDrag" />
                    </Listeners>
                </f:Panel>
                <f:Panel ID="bodyRegion" CssClass="bodyregion" RegionPosition="Center" ShowBorder="false" ShowHeader="false" Layout="VBox" runat="server">
                    <Items>
                        <f:ContentPanel ID="topPanel" CssClass="topregion" ShowBorder="false" ShowHeader="false" runat="server">
                            <div id="header" class="f-widget-header f-mainheader">
                                <div class="header-left">
                                    <f:Button runat="server" ID="btnCollapseSidebar" CssClass="icononlyaction" ToolTip="折叠/展开侧边栏" IconAlign="Top" IconFont="_Fold"
                                        EnableDefaultState="false" TabIndex="-1" ClickHandler="onFoldClick">
                                    </f:Button>
                                    <div id="breadcrumb">
                                        <div class="breadcrumb-inner">
                                        </div>
                                        <div class="breadcrumb-icons">
                                            <a data-qtip="查看源代码" href="javascript:onToolSourceCodeClick();"><i class="f-icon f-iconfont f-iconfont-code"></i></a>
                                            <a data-qtip="刷新本页" href="javascript:onToolRefreshClick();"><i class="f-icon f-iconfont f-iconfont-refresh"></i></a>
                                            <a data-qtip="在新标签页中打开" href="javascript:onToolNewWindowClick();"><i class="f-icon f-iconfont f-iconfont-new-tab"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="header-right">
                                    <f:TwinTriggerBox ID="ttbxSearch" CssClass="searchbox collapsed" ShowLabel="false" Trigger1Icon="Clear" ShowTrigger1="false"
                                        EmptyText="搜索示例" Trigger2Icon="Search"
                                        runat="server" Width="24px">
                                        <Listeners>
                                            <f:Listener Event="trigger1click" Handler="onSearchTrigger1Click" />
                                            <f:Listener Event="trigger2click" Handler="onSearchTrigger2Click" />
                                            <f:Listener Event="blur" Handler="onSearchBlur" />
                                        </Listeners>
                                    </f:TwinTriggerBox>
                                    <f:Button ID="btnBaseDownload" runat="server" CssClass="icononlyaction btn-apply-trial" ToolTip="社区版下载" IconAlign="Top" IconFont="_Download"
                                        EnableDefaultState="false" TabIndex="-1"
                                        Badge="true" BadgeType="Warning" BadgeAnimationType="Processing" ClickHandler="onBaseDownloadClick">
                                    </f:Button>
                                    <f:Button runat="server" CssClass="icononlyaction" ID="btnThemeSelect" ToolTip="主题仓库" IconAlign="Top" IconFont="_Skin"
                                        EnableDefaultState="false" TabIndex="-1" ClickHandler="onThemeSelectClick">
                                    </f:Button>
                                    <f:Button runat="server" CssClass="userpicaction" ID="btnUserAvatar" Text="三生石上" IconUrl="~/res/images/my_face_80.jpg" IconAlign="Left"
                                        EnableDefaultState="false">
                                        <Menu runat="server" ID="menuSettings">
                                            <f:MenuCheckBox runat="server" ID="cbxShowOnlyCommunity" Text="仅显示社区版示例" ClickHandler="onShowOnlyCommunityClick"></f:MenuCheckBox>
                                            <f:MenuButton runat="server" CssClass="icononlyaction" Text="企业版试用" IconFont="_Enterprise" ClickHandler="onApplyTrialClick"></f:MenuButton>
                                            <f:MenuSeparator runat="server">
                                            </f:MenuSeparator>
                                            <f:MenuButton runat="server" ID="MenuFramePageStyle" Text="框架页风格">
                                                <Menu runat="server">
                                                    <Items>
                                                        <f:MenuCheckBox Text="暗色侧栏" ID="MenuFramePageStyleDarkLeft" AttributeDataTag="f-dark-left" GroupName="MenuFramePageStyle" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="暗色顶栏" ID="MenuFramePageStyleDarkTop" AttributeDataTag="f-dark-top" GroupName="MenuFramePageStyle" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="暗色顶栏和侧栏" ID="MenuFramePageStyleDarkTopLeft" AttributeDataTag="f-dark-top-left" GroupName="MenuFramePageStyle" runat="server">
                                                        </f:MenuCheckBox>
                                                    </Items>
                                                    <Listeners>
                                                        <f:Listener Event="checkchange" Handler="onMenuFramePageStyleCheckChange" />
                                                    </Listeners>
                                                </Menu>
                                            </f:MenuButton>
                                            <f:MenuButton runat="server" ID="MenuDisplayMode" Text="显示模式">
                                                <Menu runat="server">
                                                    <Items>
                                                        <f:MenuCheckBox Text="紧凑模式" ID="MenuDisplayModeCompact" AttributeDataTag="compact" GroupName="MenuDisplayMode" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="小字体模式" ID="MenuDisplayModeSmall" AttributeDataTag="small" GroupName="MenuDisplayMode" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="普通模式" ID="MenuDisplayModeNormal" AttributeDataTag="normal" Checked="true" GroupName="MenuDisplayMode" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="大间距模式" ID="MenuDisplayModeLargeSpace" AttributeDataTag="largeSpace" GroupName="MenuDisplayMode" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="大字体模式" ID="MenuDisplayModeLarge" AttributeDataTag="large" GroupName="MenuDisplayMode" runat="server">
                                                        </f:MenuCheckBox>
                                                    </Items>
                                                    <Listeners>
                                                        <f:Listener Event="checkchange" Handler="onMenuDisplayModeCheckChange" />
                                                    </Listeners>
                                                </Menu>
                                            </f:MenuButton>
                                            <%--<f:MenuButton Text="菜单样式" ID="MenuStyle" runat="server">
                                                <Menu runat="server">
                                                    <Items>
                                                        <f:MenuCheckBox Text="智能树菜单" ID="MenuStyleTree" AttributeDataTag="tree" Checked="true" GroupName="MenuStyle" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="树菜单" ID="MenuStylePlainTree" AttributeDataTag="plaintree" GroupName="MenuStyle" runat="server">
                                                        </f:MenuCheckBox>
                                                    </Items>
                                                    <Listeners>
                                                        <f:Listener Event="checkchange" Handler="onMenuStyleCheckChange" />
                                                    </Listeners>
                                                </Menu>
                                            </f:MenuButton>--%>
                                            <f:MenuButton Text="主选项卡标签" ID="MenuMainTabs" runat="server">
                                                <Menu runat="server">
                                                    <Items>
                                                        <f:MenuCheckBox Text="多标签页" ID="MenuMainTabsMulti" AttributeDataTag="multi" Checked="true" GroupName="MenuMainTabs" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="单标签页" ID="MenuMainTabsSingle" AttributeDataTag="single" GroupName="MenuMainTabs" runat="server">
                                                        </f:MenuCheckBox>
                                                    </Items>
                                                    <Listeners>
                                                        <f:Listener Event="checkchange" Handler="onMenuMainTabsCheckChange" />
                                                    </Listeners>
                                                </Menu>
                                            </f:MenuButton>
                                            <f:MenuButton Text="语言" ID="MenuLang" runat="server">
                                                <Menu ID="Menu2" runat="server">
                                                    <Items>
                                                        <f:MenuCheckBox Text="简体中文" ID="MenuLangZHCN" AttributeDataTag="zh_CN" Checked="true" GroupName="MenuLang" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="繁體中文" ID="MenuLangZHTW" AttributeDataTag="zh_TW" GroupName="MenuLang" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="English" ID="MenuLangEN" AttributeDataTag="en" GroupName="MenuLang" runat="server">
                                                        </f:MenuCheckBox>
                                                        <f:MenuCheckBox Text="ئۇيغۇر تىلى" ID="MenuLangZHUEY" AttributeDataTag="zh_UEY" GroupName="MenuLang" runat="server">
                                                        </f:MenuCheckBox>
                                                    </Items>
                                                    <Listeners>
                                                        <f:Listener Event="checkchange" Handler="onMenuLangCheckChange" />
                                                    </Listeners>
                                                </Menu>
                                            </f:MenuButton>
                                            <f:MenuButton runat="server" Text="页面加载动画（CSS）" ClickHandler="onLoadingSelectClick"></f:MenuButton>
                                            <f:MenuSeparator runat="server">
                                            </f:MenuSeparator>
                                            <f:MenuButton Text="在线示例" runat="server" ID="MenuExamples">
                                                <Menu runat="server">
                                                    <Items>
                                                        <f:MenuHyperLink runat="server" TextRawHtml="FineUI.Pro <div class='online-examples-subtitle'>ASP.NET WebForms 控件库，经典始于 2008 年</div>" NavigateUrl="https://fineui.com/pro/demo/" Target="_blank">
                                                        </f:MenuHyperLink>
                                                        <f:MenuHyperLink runat="server" TextRawHtml="FineUI.Core <div class='online-examples-subtitle'>ASP.NET Core 控件库，创新 RazorForms 开发模式，信创产品适用</div>" NavigateUrl="https://fineui.com/core/demo/" Target="_blank">
                                                        </f:MenuHyperLink>
                                                        <f:MenuHyperLink runat="server" TextRawHtml="FineUI.Java <div class='online-examples-subtitle'>Java 生态「AI 友好 · 标签式 · 有状态」企业级全栈 UI 框架</div>" NavigateUrl="https://fineui.com/java/demo/" Target="_blank">
                                                        </f:MenuHyperLink>
                                                    </Items>
                                                </Menu>
                                            </f:MenuButton>
                                            <f:MenuSeparator runat="server">
                                            </f:MenuSeparator>
                                            <f:MenuText runat="server" ID="menuTextCopyright" HideOnClick="false" CssClass="copyright-menutext">
                                            </f:MenuText>
                                        </Menu>
                                    </f:Button>
                                </div>
                            </div>
                        </f:ContentPanel>
                        <f:TabStrip ID="mainTabStrip" CssClass="centerregion" ShowInkBar="true" BoxFlex="1" ShowBorder="true" EnableTabCloseMenu="true" runat="server">
                            <Tabs>
                                <f:Tab ID="tabHomepage" Title="首页" IconFont="_Home" EnableIFrame="true" IFrameUrl="~/common/main.aspx" runat="server">
                                </f:Tab>
                            </Tabs>
                            <Tools>
                                <f:Tool runat="server" IconFont="_Code" CssClass="tabtool viewcode" ToolTip="查看源代码" ID="toolSourceCode" ClickHandler="onToolSourceCodeClick"></f:Tool>
                                <f:Tool runat="server" IconFont="_Refresh" CssClass="tabtool" ToolTip="刷新本页" ID="toolRefresh" ClickHandler="onToolRefreshClick"></f:Tool>
                                <f:Tool runat="server" IconFont="_NewTab" CssClass="tabtool" ToolTip="在新标签页中打开" ID="toolNewWindow" ClickHandler="onToolNewWindowClick"></f:Tool>
                            </Tools>
                        </f:TabStrip>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <f:Window ID="windowSourceCode" IconFont="_Code" Title="源代码" Hidden="true" EnableIFrame="true"
            runat="server" IsModal="true" Width="1000px" Height="600px" EnableClose="true"
            EnableMaximize="true" EnableResize="true">
        </f:Window>
        <f:Window ID="windowThemeRoller" Title="主题仓库" Hidden="true" EnableIFrame="true" IFrameUrl="./common/themes.aspx" ClearIFrameAfterClose="false"
            runat="server" IsModal="true" Width="850px" Height="600px" EnableClose="true"
            EnableMaximize="true" EnableResize="true" WindowPosition="Center">
        </f:Window>
        <f:Window ID="windowLoadingSelector" Title="页面加载动画（CSS）" Hidden="true" EnableIFrame="true" IFrameUrl="./common/loading_css.aspx" ClearIFrameAfterClose="false"
            runat="server" IsModal="true" Width="500px" Height="400px" EnableClose="true"
            EnableMaximize="true" EnableResize="true">
        </f:Window>

        <f:Window ID="windowApplyTrial" Title="企业版试用" Hidden="true"
            runat="server" IsModal="true" Width="450px" EnableClose="true"
            EnableMaximize="false" BodyPadding="15px" IconFont="_Mail">
            <Content>
                <div>
                    <div>
                        请填写如下资料发送到邮箱：2877408506@qq.com
                    </div>
                    <ul class="applytrial">
                        <li>产品名称：FineUI.Pro（企业版）</li>
                        <li>单位全称：XXX单位</li>
                        <li>申请人邮箱：XXX</li>
                        <li>申请人QQ：XXX</li>
                        <li>申请人姓名：XXX</li>
                        <li>申请人地址：XX省XX市</li>
                    </ul>
                </div>
            </Content>
        </f:Window>

        <asp:XmlDataSource ID="XmlDataSource1" runat="server" EnableCaching="false" DataFile="~/res/menu.xml"></asp:XmlDataSource>

        <f:HiddenField runat="server" ID="hfExamplesCount"></f:HiddenField>
    </form>

    <script>
        var PARAMS = {
            mainPanel: '<%= mainPanel.ClientID %>',
            mainTabStrip: '<%= mainTabStrip.ClientID %>',
            treeMenu: '<%= treeMenu.ClientID %>',
            sidebarRegion: '<%= sidebarRegion.ClientID %>',
            btnCollapseSidebar: '<%= btnCollapseSidebar.ClientID %>',
            windowSourceCode: '<%= windowSourceCode.ClientID %>',
            windowThemeRoller: '<%= windowThemeRoller.ClientID %>',
            windowLoadingSelector: '<%= windowLoadingSelector.ClientID %>',
            windowApplyTrial: '<%= windowApplyTrial.ClientID %>',
            hfExamplesCount: '<%= hfExamplesCount.ClientID %>',
            sourceUrl: '<%= PageContext.ResolveUrl("~/common/source.aspx") %>',
            dashboardUrl: '<%= PageContext.ResolveUrl("~/block/dashboard.aspx") %>',
            mainUrl: '<%= PageContext.ResolveUrl("~/common/main.aspx") %>',
            processNewWindowUrl: function (url) {
                return url.replace(/\/mobile\/\?file=/ig, '/mobile/');
            }
        };
    </script>

    <script type="text/javascript" src="<%= PageContext.ResolveUrl("~/res/js/index.js?v" + GlobalConfig.ProductVersion) %>"></script>
    <script type="text/javascript" src="<%= PageContext.ResolveUrl("~/res/js/mobileview.js?v" + GlobalConfig.ProductVersion) %>"></script>

</body>
</html>
