<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_columnmove_lockcolumn.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_columnmove_lockcolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server"
            AllowColumnLocking="true" EnableCollapse="false"
            EnableColumnMove="true">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:BoundField ColumnID="Name" EnableLock="false" Locked="true" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" EnableLock="true" Locked="true" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField ColumnID="AtSchool" EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" Width="300px" EnableLock="true" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField ColumnID="LogTime" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
            <Listeners>
                <f:Listener Event="columnmove" Handler="onGridColumnMove" />
                <f:Listener Event="columnlock" Handler="onGridColumnLock" />
                <f:Listener Event="columnunlock" Handler="onGridColumnUnlock" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（保持列顺序和列锁定状态）" ClickHandler="onRefreshClick"></f:Button>
        <br />
        <br />
        注：[姓名]列锁定后无法通过表头菜单解锁；[性别]列锁定后仍可通过表头菜单解锁。
    </form>

    <script>

        function onRefreshClick(event) {
            window.location.reload();
        }

        function saveToDB(grid) {
            // 列顺序数组
            var columnIds = $.map(grid.columns, function (item, index) {
                return item.columnId;
            });

            // 锁定列数组
            var lockedColumnIds = [];
            $.each(grid.columns, function (index, item) {
                if (item.locked) {
                    lockedColumnIds.push(item.columnId);
                }
            });

            // 回发，保存到数据库
            F.customEvent('Grid1_ColumnMoveOrLock', {
                columnIds: columnIds,
                lockedColumnIds: lockedColumnIds
            });
        }


        function onGridColumnLock(event, columnId) {
            saveToDB(this);
        }

        function onGridColumnUnlock(event, columnId) {
            saveToDB(this);
        }

        function onGridColumnMove(event, targetColumnId, sourceColumnId, operation) {
            var grid = this;

            // 如果目标列和源列的锁定状态不同，则随后会触发 columnlock 或者 columnunlock 事件
            // 因此直接返回，不要调用 saveToDB 函数，否则会重复保存
            var targetColumn = grid.getColumn(targetColumnId);
            var sourceColumn = grid.getColumn(sourceColumnId);

            // 有可能 locked 属性是 undefined，所以这里要先通过 !! 转为布尔值
            if (!!targetColumn.locked != !!sourceColumn.locked) {
                return;
            }

            saveToDB(this);
        }

    </script>
</body>
</html>
