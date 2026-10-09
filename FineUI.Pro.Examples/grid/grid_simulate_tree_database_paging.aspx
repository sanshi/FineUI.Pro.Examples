<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_simulate_tree_database_paging.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_simulate_tree_database_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" AllowPaging="true" IsDatabasePaging="true" PageSize="1" Height="500px" OnPageIndexChanged="Grid1_PageIndexChanged"
            ShowPagingMessage="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" DataSimulateTreeLevelField="TreeLevel" HeaderText="地区" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
