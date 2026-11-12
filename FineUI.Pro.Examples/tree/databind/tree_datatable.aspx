<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_datatable.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.databind.tree_datatable" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" EnableCollapse="false"
            Title="树控件（DataSet->Relations）" runat="server">
        </f:Tree>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示把具有父子关系的数据记录转换为树节点层级。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>展开绑定的层级</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（DataSet-&gt;Relations）">树控件（DataSet-&gt;Relations）</strong>展开中国和省级目录。<br />结果：根、目录与叶子按数据关系显示，展开只影响当前分支。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Nodes</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tree1").ClientID %>' title="树控件（DataSet-&gt;Relations）">树控件（DataSet-&gt;Relations）</strong>）：后台根据父子记录递归创建节点集合。</li>
    </ul>
</section>
</template>
</body>
</html>
