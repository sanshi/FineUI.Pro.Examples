<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_columnmove_orderwidthhidden.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_columnmove_orderwidthhidden" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableColumnMove="true">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" BoxFlex="1" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="columnmove" Handler="onGridColumnMove" />
                <f:Listener Event="columnresize" Handler="onGridColumnResize" />
                <f:Listener Event="columnhide" Handler="onGridColumnHide" />
                <f:Listener Event="columnshow" Handler="onGridColumnShow" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（保持列顺序+宽度+隐藏）" ClickHandler="onRefreshClick"></f:Button>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onRefreshClick(event) {
            window.location.reload();
        }

        function saveToDB(grid) {
            // 列顺序数组
            var columnIds = $.map(grid.columns, function(item, index) {
                return {
                    'columnId': item.columnId,
                    'hidden': item.hidden,
                    'width': item.width,
                    'flex': item.flex
                };
            });

            // 保存到数据库
            F.customEvent('Grid1_ColumnMove', {
                columnIds: columnIds
            });
        }

        function onGridColumnMove(event, targetColumnId, sourceColumnId, operation) {
            saveToDB(this);
        }

        function onGridColumnResize(event, columnId, newColumnWidth) {
            saveToDB(this);
        }

        function onGridColumnHide(event, columnId) {
            saveToDB(this);
        }

        function onGridColumnShow(event, columnId) {
            saveToDB(this);
        }

    </script>
</body>
</html>
