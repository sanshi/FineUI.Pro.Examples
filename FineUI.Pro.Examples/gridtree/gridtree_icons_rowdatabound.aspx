<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_icons_rowdatabound.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_icons_rowdatabound" %>

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
            RowDataBoundFunction="onGrid1RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:BoundField Width="150px" DataField="Type" HeaderText="类型" />
                <f:BoundField Width="150px" DataField="Size" HeaderText="大小" />
                <f:BoundField Width="150px" DataField="ModifyDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="修改日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="../res/js/grid.js"></script>

    <script>

        function onGrid1RowDataBound(rowData) {
            var rowId = rowData.id;

            // 默认展开的节点
            if (rowId === '50' || rowId === '60' || rowId === '63' || rowId === '64') {
                rowData.expanded = true;
            }

            var name = rowData.values.Name;
            var lastDotIndex = name.lastIndexOf('.');
            if (lastDotIndex >= 0) {
                var fileType = name.substr(lastDotIndex + 1).toLowerCase();

                if (fileType === 'png' || fileType === 'ico' || fileType === 'gif') {
                    rowData.iconFont = 'f-iconfont-pic';
                }
                else {
                    rowData.icon = F.resolveUrl('/res/images/filetype/vs_' + fileType + '.png');
                }
            }
        }

    </script>

</body>
</html>
