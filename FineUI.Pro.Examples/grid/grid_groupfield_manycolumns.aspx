<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_groupfield_manycolumns.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_groupfield_manycolumns" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" IsViewPort="true" ShowBorder="true" ShowHeader="true" EnableCollapse="false" EnableColumnLines="true"
            AllowColumnLocking="true" Title="多级分组表头 + 大量列（约 425 列，验证表头/表体列线对齐）" runat="server">
            <Columns>
                <f:RowNumberField />
            </Columns>
        </f:Grid>
    </form>
</body>
</html>
