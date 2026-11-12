<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_nodedatabound.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.tree_nodedatabound" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tree/databind/website.xml" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false" OnNodeDataBound="Tree1_NodeDataBound"
            ShowHeader="true" Title="树控件（NodeDataBound事件）" runat="server">
        </f:Tree>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/tree/databind/website.xml"></asp:XmlDataSource>
        <br />

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在树节点绑定事件中读取 XML 标记，为指定节点设置高亮文字。</p>
    <h3><i class="f-iconfont f-iconfont-list" aria-hidden="true"></i>对照绑定后的节点</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（NodeDataBound事件）">树控件（NodeDataBound事件）</strong>对照驻马店市和合肥市。<br />结果：后台绑定 XML 时读取 <code>Highlight</code> 标记，指定节点按本页样式显示，其它节点保持普通外观。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>在 <code>NodeDataBound</code> 事件中，将 "驻马店市" 和 "合肥市" 置为高亮状态。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>OnNodeDataBound</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（NodeDataBound事件）">树控件（NodeDataBound事件）</strong>）：设为<code>Tree1_NodeDataBound</code>，每个节点绑定后读取对应 XML 数据并设置本页显示。</li>
        <li><code>TextRawHtml</code>（<strong>树节点</strong>，位于<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（NodeDataBound事件）">树控件（NodeDataBound事件）</strong>）：使用本页可信模板包裹文字，显示高亮样式。</li>
    </ul>
</section>
</template>
</body>
</html>
