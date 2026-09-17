<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_lockcolumn.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_lockcolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId"
            AllowColumnLocking="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" EnableLock="true" Locked="true" Width="300px" />
                <f:BoundField Width="150px" DataField="Type" HeaderText="类型" EnableLock="true" />
                <f:BoundField Width="150px" DataField="Size" HeaderText="大小" EnableLock="true" />
                <f:BoundField Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="修改日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
