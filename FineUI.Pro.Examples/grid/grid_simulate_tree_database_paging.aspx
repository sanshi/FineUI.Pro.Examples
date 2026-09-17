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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格"  EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="true" AllowPaging="true" IsDatabasePaging="true" PageSize="1" 
            Height="500px" OnPageIndexChanged="Grid1_PageIndexChanged" ShowPagingMessage="false">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataSimulateTreeLevelField="TreeLevel" DataFormatString="{0}"
                    HeaderText="地区" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
            </Columns>
        </f:Grid>
    </form>
</body>
</html>
