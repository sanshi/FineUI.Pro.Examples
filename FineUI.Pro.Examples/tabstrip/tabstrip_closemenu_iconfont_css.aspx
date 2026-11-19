<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_closemenu_iconfont_css.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_closemenu_iconfont_css" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-tabstrip-tabmenu-close .f-menu-item-icon-wrap:before,
        .f-tabstrip-tabmenu-close-others .f-menu-item-icon-wrap:before,
        .f-tabstrip-tabmenu-close-all .f-menu-item-icon-wrap:before {
            font-family: "FontAwesome";
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            font-size: 16px;
        }

        .f-tabstrip-tabmenu-close .f-menu-item-icon-wrap:before {
            content: "\f00d";
        }

        .f-tabstrip-tabmenu-close-others .f-menu-item-icon-wrap:before {
            content: "\f014";
        }

        .f-tabstrip-tabmenu-close-all .f-menu-item-icon-wrap:before {
            content: "\f1f8";
        }

        .f-largemode .f-tabstrip-tabmenu-close .f-menu-item-icon-wrap:before,
        .f-largemode .f-tabstrip-tabmenu-close-others .f-menu-item-icon-wrap:before,
        .f-largemode .f-tabstrip-tabmenu-close-all .f-menu-item-icon-wrap:before {
            font-size: 20px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" EnableTabCloseMenu="true" ShowBorder="true" ActiveTabIndex="1" runat="server">
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
        <f:Button ID="btnShowInClient" Text="显示标签三（客户端代码）" CssClass="marginr" runat="server" ClickHandler="onShowInClientClick">
        </f:Button>
        <f:Button ID="btnHideInClient" Text="隐藏标签三（客户端代码）" runat="server" ClickHandler="onHideInClientClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowInServer" Text="显示标签三（服务端代码）" CssClass="marginr" runat="server" OnClick="btnShowInServer_Click">
        </f:Button>
        <f:Button ID="btnHideInServer" Text="隐藏标签三（服务端代码）" runat="server" OnClick="btnHideInServer_Click">
        </f:Button>
        <br />
        <br />
        <br />

    </form>
    <script>
        var Tab3ClientID = '<%= Tab3.ClientID %>';

        function onShowInClientClick(event) {
            F(Tab3ClientID).show();
        }

        function onHideInClientClick(event) {
            F(Tab3ClientID).hide();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示通过 CSS 伪元素为标签右键菜单显示字体图标。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>使用标签右键菜单</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="选项卡">选项卡</strong>的<code>标签二</code>标题上点击右键。<br />结果：出现关闭当前、其它及全部标签等菜单项；菜单项前的图标按本页字体图标配置显示。</li>
                <li>从初始状态右键标签二，选择<strong>关闭其它标签</strong>。<br />结果：其它允许关闭的标签被关闭；设置为不可关闭的标签一继续保留。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>推荐使用 JavaScript 方式来新增菜单项的图标字体，更加灵活可靠。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableTabCloseMenu</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>'
                        title="选项卡">选项卡</strong>）：初始为<code>true</code>，启用标题栏的右键关闭菜单。</li>
                <li><code>::before</code>（<strong>标签右键菜单项</strong>）：本页 CSS 为菜单项的伪元素设置字体图标。</li>
            </ul>
        </section>
    </template>
</body>
</html>
