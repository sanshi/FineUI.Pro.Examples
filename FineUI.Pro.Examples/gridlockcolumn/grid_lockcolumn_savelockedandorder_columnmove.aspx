<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn_savelockedandorder_columnmove.aspx.cs" Inherits="FineUI.Pro.Examples.gridlockcolumn.grid_lockcolumn_savelockedandorder_columnmove" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" Width="1000px" runat="server"
            AllowColumnLocking="true" EnableCollapse="false" EnableColumnMove="true">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:RenderField ColumnID="Name" EnableLock="true" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" EnableLock="true" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="400px" EnableLock="true" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField EnableLock="true" DataField="ShenGao" ColumnID="ShenGao" HeaderText="身高" />
                <f:RenderField EnableLock="true" DataField="TiZhong" ColumnID="TiZhong" HeaderText="体重" />
                <f:RenderField EnableLock="true" DataField="XueYaDi" ColumnID="XueYaDi" HeaderText="血压（低）" />
                <f:RenderField EnableLock="true" DataField="XueYaGao" ColumnID="XueYaGao" HeaderText="血压（高）" />
                <f:RenderField EnableLock="true" DataField="ShiLiZuo" ColumnID="ShiLiZuo" HeaderText="视力（左）" />
                <f:RenderField EnableLock="true" DataField="ShiLiYou" ColumnID="ShiLiYou" HeaderText="视力（右）" />
                <f:RenderField ColumnID="Group" EnableLock="true" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" EnableLock="true" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="columnlock" Handler="onGridColumnLock" />
                <f:Listener Event="columnunlock" Handler="onGridColumnUnlock" />
                <f:Listener Event="columnmove" Handler="onGridColumnMove" />
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（保存列锁定状态和列顺序）" ClickHandler="onRefreshClick"></f:Button>
        <br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
        <br />
        <br />
        注：列拖拽排序时可能会改变列的锁定状态。
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var labResultClientID = '<%= labResult.ClientID %>';

        function onRefreshClick(event) {
            window.location.reload();
        }

        function showLockedTips(grid) {
            var lockedLeftColumns = [];

            $.each(grid.columns, function(index, column) {
                if (column.locked) {
                    lockedLeftColumns.push(column.text || column.columnId);
                }
            });

            // 显示锁定列提示信息
            F(labResultClientID).setValue('左侧锁定列：' + lockedLeftColumns.join(', '));
        }


        function saveToDB(grid) {
            // 显示锁定列提示信息
            showLockedTips(grid);

            // 列锁定和列顺序
            var configedColumns = $.map(grid.columns, function(column, index) {
                return {
                    ColumnID: column.columnId,
                    Locked: column.locked
                };
            });


            // 保存到数据库
            F.customEvent('Grid1_ColumnLockUnlock', {
                configedColumns: configedColumns
            });
        }


        function onGridColumnLock(event, columnId) {
            saveToDB(this);
        }

        function onGridColumnUnlock(event, columnId) {
            saveToDB(this);
        }

        function onGridColumnMove(event, targetColumnId, sourceColumnId, operation) {
            saveToDB(this);
        }


        function onGridDataLoad(event) {
            // 显示锁定列提示信息
            showLockedTips(this);
        }

    </script>
</body>
</html>
