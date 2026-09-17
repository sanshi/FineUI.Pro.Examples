<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_filter_dynamic_columns.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_filter_dynamic_columns" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/Code/NewFilteredTable.cs" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（动态创建的列）" runat="server" EnableCollapse="false"
            AllowFilters="true" OnFilterChanged="Grid1_FilterChanged">
        </f:Grid>
        <br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
</body>
</html>
