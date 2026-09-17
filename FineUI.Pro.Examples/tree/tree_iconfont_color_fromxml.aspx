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
        <f:Tree ID="Tree1" IsFluid="true" ShowHeader="true" Title="树控件" EnableCollapse="false"
            runat="server" OnPreNodeDataBound="Tree1_PreNodeDataBound">
        </f:Tree>
        <asp:XmlDataSource ID="XmlDataSource1" EnableCaching="false" runat="server" DataFile="~/tree/tree_iconfont_randomcolor.xml"></asp:XmlDataSource>
        <br />
        <f:Button ID="btnGetSelectedNode" OnClick="btnGetSelectedNode_Click" CssClass="marginr"
            runat="server" Text="获取选中的节点">
        </f:Button>
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
    </form>
</body>
</html>
