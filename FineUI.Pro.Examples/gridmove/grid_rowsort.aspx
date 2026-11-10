<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowsort.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowsort" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>行移动（拖拽排序）</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="任务优先级" DataIDField="Id" DataTextField="Name" EnableRowMove="true" runat="server">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" Width="70" />
                <f:RenderField ColumnID="Name" HeaderText="任务" DataField="Name" ExpandUnusedSpace="true" />
            </Columns>
            <Listeners>
                <f:Listener Event="rowmove" Handler="onRowMove" />
            </Listeners>
        </f:Grid>
        <p>拖动行左侧的手柄，将任务放到目标行的上方或下方。松手后更新顺序，刷新页面恢复初始顺序。</p>
        <p id="rowSortResult" aria-live="polite"></p>
    </form>
    <script>
        function onRowMove(event, sourceRowId, targetRowId, position) {
            // 用稳定的行 ID 记录顺序，业务需要时可将这组 ID 提交给后台保存。
            const rowIds = this.data.map(row => row.id);
            document.getElementById('rowSortResult').textContent = '当前顺序：' + rowIds.join('、');
        }

    </script>
</body>
</html>
