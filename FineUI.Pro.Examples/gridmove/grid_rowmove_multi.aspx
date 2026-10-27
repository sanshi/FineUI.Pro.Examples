<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowmove_multi.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowmove_multi" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（可多选）" runat="server" EnableCollapse="false" EnableMultiSelect="true"
            EnableCheckBoxSelect="true" DataIDField="Id">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnMoveUp" Text="选中行上移" CssClass="marginr" ClickHandler="onMoveUpClick"></f:Button>
        <f:Button runat="server" ID="btnMoveDown" Text="选中行下移" CssClass="marginr" ClickHandler="onMoveDownClick"></f:Button>
        <br />
        <br />
        <f:Button CssClass="marginr" runat="server" ID="btnSaveToDB" Text="保存数据" ClickHandler="onSaveToDBClick"></f:Button>
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（请先点击保存按钮）" ClickHandler="onRefreshClick"></f:Button>
        <br />
        <br />
        <br />
        注：请同时选中多行，然后进行操作。
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onRefreshClick(event) {
            window.location.reload();
        }


        var gridClientID = '<%= Grid1.ClientID %>';

        function onMoveUpClick(event) {
            var grid = F(gridClientID);

            // 向上移动
            grid.moveRowsUp(grid.getSelectedRows());
        }

        function onMoveDownClick(event) {
            var grid = F(gridClientID);

            // 向上移动
            grid.moveRowsDown(grid.getSelectedRows());
        }

        function onSaveToDBClick(event) {
            var grid = F(gridClientID);

            // 列顺序数组
            var rowIds = $.map(grid.data, function(item, index) {
                return item.id;
            });

            // 保存到数据库
            F.customEvent('Grid1_RowMove', {
                rowIds: rowIds
            });
        }

    </script>
</body>
</html>
