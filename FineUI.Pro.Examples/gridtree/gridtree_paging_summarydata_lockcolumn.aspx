<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_paging_summarydata_lockcolumn.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_paging_summarydata_lockcolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-row-summary .f-grid-cell-text {
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" Height="400px" runat="server" EnableCollapse="false"
            EnableCheckBoxSelect="true"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId"
            OnRowDataBound="Grid1_RowDataBound"
            AllowPaging="true" IsDatabasePaging="true" PageSize="2" OnPageIndexChanged="Grid1_PageIndexChanged"
            EnableSummary="true" SummaryPosition="Bottom"
            AllowColumnLocking="true" ShowSelectedCell="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField EnableLock="true" ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:BoundField EnableLock="true" Width="150px" DataField="Type" HeaderText="类型" />
                <f:BoundField EnableLock="true" ColumnID="Size" Width="150px" DataField="Size" HeaderText="大小" />
                <f:BoundField EnableLock="true" Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="修改日期" />
            </Columns>
            <PageItems>
                <f:ToolbarSeparator runat="server"></f:ToolbarSeparator>
                <f:Button runat="server" ID="btnExpandAll" Text="展开全部" ClickHandler="onExpandAllClick"></f:Button>
                <f:Button runat="server" ID="btnCollapseAll" Text="折叠全部" ClickHandler="onCollapseAllClick"></f:Button>
            </PageItems>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="../res/js/grid.js"></script>
    <script>

        var gridID = '<%= Grid1.ClientID %>';

        function onExpandAllClick(event) {
            F(gridID).expandRows();
        }


        function onCollapseAllClick(event) {
            F(gridID).collapseRows();
        }

    </script>
</body>
</html>
