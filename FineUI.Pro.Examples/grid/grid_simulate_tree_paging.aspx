<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_simulate_tree_paging.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_simulate_tree_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" AllowPaging="true" IsDatabasePaging="false" PageSize="15" Height="500px">
            <Columns>
                <f:RenderField DataField="Name" DataSimulateTreeLevelField="TreeLevel" HeaderText="地区" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
