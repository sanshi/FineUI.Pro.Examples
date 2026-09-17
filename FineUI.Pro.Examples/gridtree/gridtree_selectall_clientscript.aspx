<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_selectall_clientscript.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_selectall_clientscript" %>

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
            OnRowDataBound="Grid1_RowDataBound"
            EnableCheckBoxSelect="true" KeepCurrentSelection="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:BoundField Width="150px" DataField="Type" HeaderText="类型" />
                <f:BoundField Width="150px" DataField="Size" HeaderText="大小" />
                <f:BoundField Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="修改日期" />
            </Columns>
            <Listeners>
                <f:Listener Event="rowselect" Handler="onGridRowSelect" />
                <f:Listener Event="rowdeselect" Handler="onGridRowDeselect" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
        注：
        <ul>
            <li>本树表格默认展开 [basic] 和 [res] 两个目录</li>
            <li>注意表格属性：EnableCheckBoxSelect="true" KeepCurrentSelection="true"</li>
            <li>表格客户端函数 selectRows 的第二个参数，用来指示是否保持现有选中项</li>
        </ul>
    </form>

    <script src="../res/js/grid.js"></script>
    <script>

        // 递归遍历节点 rowData 的所有子节点
        function resolveRowChildren(rowData, callback) {
            var children = rowData.children;
            if (children && children.length) {
                for (var i = 0, count = children.length; i < count; i++) {
                    var item = children[i];
                    callback.apply(item);
                    resolveRowChildren(item, callback);
                }
            }
        }

        function onGridRowSelect(event, rowId) {
            var grid = this, rowData = grid.getRowData(rowId);

            var rowIds = [];
            resolveRowChildren(rowData, function () {
                rowIds.push(this.id);
            });

            // 本过程中不触发事件
            F.noEvent(function () {
                // 第二个参数true：保持现有选中项
                grid.selectRows(rowIds, { keep: true });
            });
        }

        function onGridRowDeselect(event, rowId) {
            var grid = this, rowData = grid.getRowData(rowId);

            var rowIds = [];
            resolveRowChildren(rowData, function () {
                rowIds.push(this.id);
            });

            // 本过程中不触发事件
            F.noEvent(function () {
                // 第二个参数true：保持现有选中项
                grid.deselectRows(rowIds);
            });
        }

    </script>
</body>
</html>
