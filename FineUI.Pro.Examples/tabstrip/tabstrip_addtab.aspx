<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_addtab.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_addtab" %>

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
                <f:Tab Title="FineUI官网" EnableIFrame="true" IFrameUrl="https://fineui.com/" runat="server">
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
        注意：这些标签都是通过JavaScript脚本添加的，因此服务端无法取得这些动态添加的标签。
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
                icon: '<%= IconHelper.GetResolvedIconUrl(Icon.Application) %>'
            });
        }

        function onAddTab2Click(event) {
            F(TabStrip1ClientID).addTab({
                iframe: true,
                iframeUrl: 'https://asp.net/',
                id: 'dynamic_tab2',
                title: 'ASP.NET官网（客户端代码）',
                closable: true,
                iconFont: 'f-iconfont-tag'
            });
        }

        function onRemoveTab1Click(event) {
            F(TabStrip1ClientID).closeTab('dynamic_tab1');
        }

        function onRemoveTab2Click(event) {
            F(TabStrip1ClientID).closeTab('dynamic_tab2');
        }

    </script>
</body>
</html>
