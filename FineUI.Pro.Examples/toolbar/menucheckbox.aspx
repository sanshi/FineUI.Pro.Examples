<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menucheckbox.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.menucheckbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelExample1" IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="300px" Title="面板" EnableCollapse="false" runat="server">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:Button ID="btnLangMenu" Text="系统语言" runat="server">
                            <Menu runat="server">
                                <f:MenuCheckBox Text="English" ID="MenuLangEnglish" GroupName="MenuLang" OnCheckedChanged="MenuLang_CheckedChanged"
                                    Checked="true" runat="server">
                                </f:MenuCheckBox>
                                <f:MenuCheckBox Text="简体中文" ID="MenuLangZHCN" GroupName="MenuLang" OnCheckedChanged="MenuLang_CheckedChanged" runat="server">
                                </f:MenuCheckBox>
                                <f:MenuCheckBox Text="繁體中文" ID="MenuLangZHTW" GroupName="MenuLang" OnCheckedChanged="MenuLang_CheckedChanged" runat="server">
                                </f:MenuCheckBox>
                            </Menu>
                        </f:Button>
                        <f:Button ID="btnSiteMenu" Text="喜欢的站点" runat="server">
                            <Menu runat="server">
                                <f:MenuCheckBox Text="baidu.com" ID="MenuSiteBaidu" OnCheckedChanged="MenuSite_CheckedChanged" Checked="true" runat="server">
                                </f:MenuCheckBox>
                                <f:MenuCheckBox Text="google.com" ID="MenuSiteGoogle" Checked="true" OnCheckedChanged="MenuSite_CheckedChanged" runat="server">
                                </f:MenuCheckBox>
                                <f:MenuCheckBox Text="microsoft.com" ID="MenuSiteMicrosoft" OnCheckedChanged="MenuSite_CheckedChanged" runat="server">
                                </f:MenuCheckBox>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Label ID="labLangResult" runat="server">
                </f:Label>
                <f:Label ID="labSiteResult" runat="server">
                </f:Label>
                <f:Button Text="获取喜欢的站点（客户端脚本）" runat="server" ClickHandler="onGetSiteMenuChecked"></f:Button>
            </Items>
        </f:Panel>
    </form>
    <script>
        var btnSiteMenuClientID = '<%= btnSiteMenu.ClientID %>';

        function onGetSiteMenuChecked(event) {
            var result = [];
            var checkedItems = F(btnSiteMenuClientID).menu.getCheckedItems();
            $.each(checkedItems, function(index, item) {
                result.push(item.getText());
            });

            F.alert('喜欢的站点：' + result.join(', '));
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示菜单中的互斥语言选择和可同时勾选的站点集合，并读取最新结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check-box" aria-hidden="true"></i>选择语言与多个站点</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLangMenu").ClientID %>'
                        title="系统语言">系统语言</strong>。<br />结果：浏览器展开语言菜单。</li>
                <li>选择<strong>简体中文</strong>。<br />结果：同组其它语言取消勾选，变化事件回发，后台更新当前语言结果。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSiteMenu").ClientID %>'
                        title="喜欢的站点">喜欢的站点</strong>。<br />结果：浏览器展开可以多选的站点菜单。</li>
                <li>勾选<strong>microsoft.com</strong>，再取消勾选。<br />结果：其它站点的勾选继续保留，结果集合随本次操作加入或移除对应站点。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>GroupName</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuLangEnglish").ClientID %>' title="第 1 个复选菜单项">第 1
                        个复选菜单项</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuLangZHCN").ClientID %>' title="第 2 个复选菜单项">第 2 个复选菜单项</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuLangZHTW").ClientID %>'
                        title="第 3 个复选菜单项">第 3 个复选菜单项</strong>）：初始为<code>MenuLang</code>，语言菜单项使用相同组名，形成互斥选择；站点项不分同一互斥组。</li>
                <li><code>Checked</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuLangEnglish").ClientID %>' title="第 1 个复选菜单项">第 1
                        个复选菜单项</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuSiteBaidu").ClientID %>' title="第 4 个复选菜单项">第 4
                        个复选菜单项</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuSiteGoogle").ClientID %>' title="第 5 个复选菜单项">第 5
                        个复选菜单项</strong>）：初始为<code>true</code>，声明初始勾选状态，与菜单项的可用状态区分。</li>
                <li><code>OnCheckedChanged</code>（本页各复选菜单项，如<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("MenuLangEnglish").ClientID %>' title="第 1 个复选菜单项">第 1
                        个复选菜单项</strong>）：各组分别设为<code>MenuLang_CheckedChanged</code>、<code>MenuSite_CheckedChanged</code>，勾选变化后读取当前状态并更新本页结果。</li>
            </ul>
        </section>
    </template>
</body>
</html>
