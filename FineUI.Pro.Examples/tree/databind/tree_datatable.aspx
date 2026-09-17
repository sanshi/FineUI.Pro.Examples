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
</body>
</html>
