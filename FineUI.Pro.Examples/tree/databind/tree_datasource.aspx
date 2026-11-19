<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_datasource.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.databind.tree_datasource" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tree/databind/website.xml" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false" ShowHeader="true" Title="树控件（绑定到 XmlDataSource）" runat="server">
        </f:Tree>
        <asp:XmlDataSource ID="XmlDataSource1" EnableCaching="false" runat="server" DataFile="~/tree/databind/website.xml"></asp:XmlDataSource>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示通过 <code>XmlDataSource</code> 读取 XML 并生成树节点。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>核对数据生成的层级</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>'
                        title="树控件（绑定到 XmlDataSource）">树控件（绑定到 XmlDataSource）</strong>展开目录并对照叶子节点。<br />结果：树按 XML 的父子关系显示节点，首次绑定完成后即可逐级展开。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataSource</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（绑定到 XmlDataSource）">树控件（绑定到
                        XmlDataSource）</strong>）：后台指定本页声明的 XML 数据源。</li>
                <li><code>DataBind()</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（绑定到 XmlDataSource）">树控件（绑定到
                        XmlDataSource）</strong>）：读取当前数据源并生成节点层级。</li>
            </ul>
        </section>
    </template>
</body>
</html>
