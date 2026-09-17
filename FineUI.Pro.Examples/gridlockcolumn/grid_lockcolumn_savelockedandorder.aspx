<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn_savelockedandorder.aspx.cs" Inherits="FineUI.Pro.Examples.gridlockcolumn.grid_lockcolumn_savelockedandorder" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" Width="1000px" runat="server"
            AllowColumnLocking="true" EnableCollapse="false"
            >
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:BoundField ColumnID="Name" EnableLock="true" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" EnableLock="true" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField ColumnID="AtSchool" EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" Width="400px" EnableLock="true" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" />
                <f:BoundField EnableLock="true" DataField="ShenGao" ColumnID="ShenGao" HeaderText="身高" />
                <f:BoundField EnableLock="true" DataField="TiZhong" ColumnID="TiZhong" HeaderText="体重" />
                <f:BoundField EnableLock="true" DataField="XueYaDi" ColumnID="XueYaDi" HeaderText="血压（低）" />
                <f:BoundField EnableLock="true" DataField="XueYaGao" ColumnID="XueYaGao" HeaderText="血压（高）" />
                <f:BoundField EnableLock="true" DataField="ShiLiZuo" ColumnID="ShiLiZuo" HeaderText="视力（左）" />
                <f:BoundField EnableLock="true" DataField="ShiLiYou" ColumnID="ShiLiYou" HeaderText="视力（右）" />
                <f:ImageField ColumnID="Group" EnableLock="true" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField ColumnID="LogTime" EnableLock="true" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
            <Listeners>
                <f:Listener Event="columnlock" Handler="onGridColumnLock" />
                <f:Listener Event="columnunlock" Handler="onGridColumnUnlock" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（保存列锁定状态和列顺序）" ClickHandler="onRefreshClick"></f:Button>
    </form>

    <script>

        function onRefreshClick(event) {
            window.location.reload();
        }

        function saveToDB(grid) {

            // 列锁定和列顺序
            var configedColumns = $.map(grid.columns, function (column, index) {
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

    </script>
</body>
</html>
