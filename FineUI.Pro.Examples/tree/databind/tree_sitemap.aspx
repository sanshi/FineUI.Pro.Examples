<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_sitemap.aspx.cs" Inherits="FineUI.Pro.Examples.tree.databind.tree_sitemap" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tree/databind/Web.sitemap" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件（绑定到 SiteMap）" EnableCollapse="false" runat="server">
            <Mappings>
                <f:XmlAttributeMapping From="url" To="NavigateUrl" />
                <f:XmlAttributeMapping From="title" To="Text" />
                <f:XmlAttributeMapping From="description" To="ToolTip" />
                <f:XmlAttributeMapping From="target" To="Target" />
            </Mappings>
        </f:Tree>
        <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/tree/databind/Web.sitemap"></asp:XmlDataSource>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示把站点地图的地址、标题与提示字段映射为树节点。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>核对数据生成的层级</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>'
                        title="树控件（绑定到 SiteMap）">树控件（绑定到 SiteMap）</strong>展开目录并对照叶子节点，将鼠标停在节点上查看提示。<br />结果：节点显示站点地图中的标题，链接与提示分别来自映射字段。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataSource</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（绑定到 SiteMap）">树控件（绑定到
                        SiteMap）</strong>）：后台指定本页声明的 XML 数据源。</li>
                <li><code>DataBind()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（绑定到 SiteMap）">树控件（绑定到
                        SiteMap）</strong>）：读取当前数据源并生成节点层级。</li>
                <li><code>Mappings</code>（<strong>树节点</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（绑定到 SiteMap）">树控件（绑定到
                        SiteMap）</strong>）：本页分别把 <code>url</code>、<code>title</code>、<code>description</code>、<code>target</code> 映射到地址、文字、提示和目标窗口。</li>
            </ul>
        </section>
    </template>
</body>
</html>
