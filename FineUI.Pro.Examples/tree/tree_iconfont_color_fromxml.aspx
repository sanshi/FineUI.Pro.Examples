<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_iconfont_color_fromxml.aspx.cs" Inherits="FineUI.Pro.Examples.tree.tree_iconfont_color_fromxml" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tree/tree_iconfont_randomcolor.xml" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件" EnableCollapse="false" runat="server" OnPreNodeDataBound="Tree1_PreNodeDataBound">
        </f:Tree>
        <asp:XmlDataSource ID="XmlDataSource1" EnableCaching="false" runat="server" DataFile="~/tree/tree_iconfont_randomcolor.xml"></asp:XmlDataSource>
        <br />
        <f:Button ID="btnGetSelectedNode" OnClick="btnGetSelectedNode_Click" CssClass="marginr" runat="server" Text="获取选中的节点">
        </f:Button>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示从 XML 节点数据读取字体图标和颜色，生成各节点的显示样式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-pic" aria-hidden="true"></i>对照节点图标颜色</h3>
            <ul>
                <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>'
                        title="树控件">树控件</strong>，对照各节点前的彩色字体图标。<br />结果：每个节点按数据源中的图标与颜色显示，节点选择和目录层级保持独立。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>IconFont</code>（<strong>树节点</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：指定节点使用的字体图标。</li>
                <li><code>IconFontColor</code>（<strong>树节点</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件">树控件</strong>）：从本页 XML
                    的对应字段读取，后台为节点生成颜色样式。</li>
            </ul>
        </section>
    </template>
</body>
</html>
