<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_nodedatabound_attributes.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.tree_nodedatabound_attributes" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tree/databind/website.xml" />

    <style>
        .f-tree-node[data-highlight=true] .f-tree-cell-text {
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false" OnNodeDataBound="Tree1_NodeDataBound"
            ShowHeader="true" Title="树控件（点击树节点回发）" runat="server" OnNodeCommand="Tree1_NodeCommand">
        </f:Tree>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/tree/databind/website.xml"></asp:XmlDataSource>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        注：
        <ul>
            <li>在 NodeDataBound 事件中，更新 "驻马店市" 和 "合肥市" 节点的 Attributes 属性</li>
            <li>点击树节点回发，可以获取节点的 Attributes 属性</li>
        </ul>
    </form>
</body>
</html>
