<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_datasource_iconfont.aspx.cs"
    Inherits="FineUI.Pro.Examples.tree.databind.tree_datasource_iconfont" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tree/databind/website.xml" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" IsFluid="true" EnableCollapse="false"
            ShowHeader="true" Title="树控件（绑定到 XmlDataSource）" runat="server">
        </f:Tree>
        <asp:XmlDataSource ID="XmlDataSource1" EnableCaching="false" runat="server" DataFile="~/tree/databind/website_iconfont.xml"></asp:XmlDataSource>
    </form>
</body>
</html>
