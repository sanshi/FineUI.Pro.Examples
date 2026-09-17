<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_contextmenu.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_contextmenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false"
            EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId"
            OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:BoundField Width="150px" DataField="Type" HeaderText="类型" />
                <f:BoundField Width="150px" DataField="Size" HeaderText="大小" />
                <f:BoundField Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="修改日期" />
            </Columns>
            <Listeners>
                <f:Listener Event="beforerowcontextmenu" Handler="onRowContextMenu" />
            </Listeners>
        </f:Grid>
        <f:Menu ID="Menu1" runat="server">
            <Items>
                <f:MenuButton ID="btnExpandRows" runat="server" Text="展开全部" ClickHandler="onExpandRows"></f:MenuButton>
                <f:MenuButton ID="btnCollapseRows" runat="server" Text="折叠全部" ClickHandler="onCollapseRows"></f:MenuButton>
            </Items>
            <Listeners>
                <f:Listener Event="show" Handler="onMenuShow" />
            </Listeners>
        </f:Menu>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
        注：在叶子节点上点击右键，则弹出菜单的菜单项都是禁用状态。
    </form>

    <script src="../res/js/grid.js"></script>
    <script>

        var gridID = '<%= Grid1.ClientID %>';
        var menuID = '<%= Menu1.ClientID %>';
        // 保存当前菜单对应的树节点ID
        var currentRowId;

        // 返回false，来阻止浏览器右键菜单
        function onRowContextMenu(event, rowId) {
            currentRowId = rowId;
            F(menuID).show();
            return false;
        }

        // 设置所有菜单项的禁用状态
        function setMenuItemsDisabled(disabled) {
            var menu = F(menuID);
            $.each(menu.items, function (index, item) {
                item.setDisabled(disabled);
            });
        }

        // 显示菜单后，检查是否禁用菜单项
        function onMenuShow(event) {
            if (currentRowId) {
                var grid = F(gridID);
                var rowData = grid.getRowData(currentRowId);
                if (rowData.leaf) {
                    setMenuItemsDisabled(true);
                } else {
                    setMenuItemsDisabled(false);
                }
            }
        }

        function onExpandRows(event) {
            if (currentRowId) {
                F(gridID).expandRow(currentRowId, true);
            }
        }

        function onCollapseRows(event) {
            if (currentRowId) {
                F(gridID).collapseRow(currentRowId, true);
            }
        }

    </script>
</body>
</html>
