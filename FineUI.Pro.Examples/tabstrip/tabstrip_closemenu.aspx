<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_closemenu.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_closemenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" EnableTabCloseMenu="true"
            ShowBorder="true" ActiveTabIndex="1" runat="server">
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
        <f:Button ID="btnShowInClient" Text="显示标签三（客户端代码）" CssClass="marginr"
 runat="server" ClickHandler="onShowInClientClick">
        </f:Button>
        <f:Button ID="btnHideInClient" Text="隐藏标签三（客户端代码）" runat="server" ClickHandler="onHideInClientClick">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowInServer" Text="显示标签三（服务端代码）" CssClass="marginr"
            runat="server" OnClick="btnShowInServer_Click">
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

        var tabStripClientID = '<%= TabStrip1.ClientID %>';

        F.ready(function () {
            var newItem = F.create({
                type: 'MenuItem',
                text: '用户自定义菜单项',
                iconFont: 'f-icon-tag',
                handler: function () {
                    // menu: this.parent
                    // tab: this.parent.target
                    var tab = this.parent.target;
                    if (tab.isType('Tab')) {
                        F.notify({
                            message: '点击了选项卡 ['+ tab.getTitle() +'] 的自定义菜单项',
                            header: false,
                            displayMilliseconds: 3000,
                            positionX: 'center',
                            positionY: 'top'
                        });
                    }
                }
            })

            var closeMenu = F(tabStripClientID).getCloseMenu();

            // 将自定义菜单项插入开始位置
            //closeMenu.insert(0, [newItem, '-']);

            // 将自定义菜单项插入结束位置
            closeMenu.add(['-', newItem]);
        });
    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示扩展标签右键菜单，在内置关闭命令后添加自定义动作。</p>
    <h3><i class="f-iconfont f-iconfont-list" aria-hidden="true"></i>使用标签右键菜单</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>的<code>标签二</code>标题上点击右键。<br />结果：出现关闭当前、其它及全部标签等菜单项；还包含用户自定义菜单项。</li>
        <li>点击<strong>用户自定义菜单项</strong>。<br />结果：浏览器显示提示，内容包含打开菜单时对应的标签名称。</li>
        <li>从初始状态右键标签二，选择<strong>关闭其它标签</strong>。<br />结果：其它允许关闭的标签被关闭；设置为不可关闭的标签一继续保留。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>在选项卡上点击鼠标右键，会看到自定义菜单项。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableTabCloseMenu</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：设为<code>true</code>，启用标题栏的右键关闭菜单。</li>
        <li><code>getCloseMenu()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：本页客户端在菜单中追加自定义动作，处理当前右键标签。</li>
    </ul>
</section>
</template>
</body>
</html>
