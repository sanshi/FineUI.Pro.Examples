<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_dynamic.aspx.cs" Inherits="FineUI.Pro.Examples.toolbar.menu_dynamic" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/toolbar/menu.xml" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="PanelExample1" IsFluid="true" ShowBorder="true" BodyPadding="10px" Height="300px" Title="面板" EnableCollapse="false" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="Top" runat="server">
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script>
        // 工具栏按钮是按 XML 配置在服务端循环生成的，共用这一个处理函数；
        // 各自要打开的地址挂在按钮的 data-tag 上（代码后置里设 AttributeDataTag）。
        function onOpenUrlClick(event) {
            window.open(this.getAttr('data-tag'), '_blank');
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示后台读取节点数据，动态创建工具栏按钮及它的多级菜单。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>使用动态生成的菜单</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>'
                        title="面板">面板</strong>中新生成的菜单按钮，再展开下一层菜单。<br />结果：菜单按数据层级出现；带链接的叶子菜单项按其配置打开页面。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Items</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>' title="面板">面板</strong>）：后台把新建按钮加入工具栏集合。</li>
                <li><code>Menu.Items.Add()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("PanelExample1").ClientID %>'
                        title="面板">面板</strong>）：根据数据递归添加子菜单，叶子项另外配置链接。</li>
            </ul>
        </section>
    </template>
</body>
</html>
