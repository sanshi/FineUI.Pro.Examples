<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_addtab_removeonclose.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_addtab_removeonclose" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" ShowBorder="true" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab ID="TabExample1" Title="FineUI官网" EnableIFrame="true" IFrameUrl="https://fineui.com/" runat="server">
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:Button ID="btnAddTab1" CssClass="marginr" Text="DeepSeek官网（客户端代码）"
 runat="server" ClickHandler="onAddTab1Click">
        </f:Button>
        <f:Button ID="btnAddTab2" CssClass="marginr" Text="ASP.NET官网（客户端代码）"
 runat="server" ClickHandler="onAddTab2Click">
        </f:Button>
        <f:Button ID="btnRemoveTab1" CssClass="marginr" Text="删除DeepSeek官网（客户端代码）"
 runat="server" ClickHandler="onRemoveTab1Click">
        </f:Button>
        <f:Button ID="btnRemoveTab2" CssClass="marginr" Text="删除ASP.NET官网（客户端代码）"
 runat="server" ClickHandler="onRemoveTab2Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnAddTab3" CssClass="marginr" Text="DeepSeek官网（服务端代码）"
            runat="server" OnClick="btnAddTab3_Click">
        </f:Button>
        <f:Button ID="btnAddTab4" CssClass="marginr" Text="ASP.NET官网（服务端代码）"
            runat="server" OnClick="btnAddTab4_Click">
        </f:Button>
        <f:Button ID="btnRemoveTab3" CssClass="marginr" Text="删除DeepSeek官网（服务端代码）"
            runat="server" OnClick="btnRemoveTab3_Click">
        </f:Button>
        <f:Button ID="btnRemoveTab4" CssClass="marginr" Text="删除ASP.NET官网（服务端代码）"
            runat="server" OnClick="btnRemoveTab4_Click">
        </f:Button>
        <br />
        <br />
        <br />
        <br />

        <br />
        如果不使用Ajax回发页面，则所有动态添加的标签都会消失。
        <br />
    </form>
    <script>

        var TabStrip1ClientID = '<%= TabStrip1.ClientID %>';

        function onAddTab1Click(event) {
            F(TabStrip1ClientID).addTab({
                iframe: true,
                iframeUrl: 'https://deepseek.com/',
                id: 'dynamic_tab1',
                title: 'DeepSeek官网（客户端代码）',
                closable: true,
                icon: '<%= IconHelper.GetResolvedIconUrl(Icon.Application) %>',
                removeOnClose: true
            });
        }

        function onAddTab2Click(event) {
            F(TabStrip1ClientID).addTab({
                iframe: true,
                iframeUrl: 'https://asp.net/',
                id: 'dynamic_tab2',
                title: 'ASP.NET官网（客户端代码）',
                closable: true,
                iconFont: 'f-iconfont-tag',
                removeOnClose: true
            });
        }

        function onRemoveTab1Click(event) {
            F(TabStrip1ClientID).closeTab('dynamic_tab1');
        }

        function onRemoveTab2Click(event) {
            F(TabStrip1ClientID).closeTab('dynamic_tab2');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示关闭动态 <code>iframe</code> 标签时移除实例，并允许随后重新创建同名标签。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>添加、关闭与重新添加</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnAddTab1").ClientID %>' title="DeepSeek官网（客户端代码）">DeepSeek官网（客户端代码）</strong>。<br />结果：浏览器新建并激活一个 <code>iframe</code> 标签，标签配置了关闭后移除实例。</li>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>关闭刚添加的标签，再点击同一个新增按钮。<br />结果：旧实例已被移除，可以重新创建相同 <code>ID</code> 的标签并正常激活。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnAddTab3").ClientID %>' title="DeepSeek官网（服务端代码）">DeepSeek官网（服务端代码）</strong>。<br />结果：按钮回发，由后台生成并下发新标签配置，再激活对应页面。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>这些标签都是通过JavaScript脚本添加的，因此服务端无法取得这些动态添加的标签。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>addTab()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：按指定 <code>ID</code>、标题及 <code>iframe</code> 地址添加标签。</li>
        <li><code>RemoveOnClose</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabExample1").ClientID %>' title="FineUI官网">FineUI官网</strong>）：初始为 <code>true</code>，关闭时移除标签实例，不仅隐藏标题。</li>
    </ul>
</section>
</template>
</body>
</html>
