<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowsort.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowsort" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>行拖拽排序</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Title="学生信息" DataIDField="Id" DataTextField="Name" EnableRowMove="true" runat="server">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="rowmove" Handler="onRowOrderChanged" />
                <f:Listener Event="dataload" Handler="onRowOrderChanged" />
            </Listeners>
        </f:Grid>
        <f:Button ID="btnSaveToDB" runat="server" Text="保存数据" CssClass="marginr" ClickHandler="onSaveToDBClick" />
        <f:Button ID="btnRefresh" runat="server" Text="刷新本页面（请先点击保存按钮）" ClickHandler="onRefreshClick" />
        <p>拖动表格最左列的六点手柄调整行顺序。点击保存数据后，刷新页面会加载最近一次保存的顺序。</p>
        <p id="rowSortResult" aria-live="polite"></p>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onRowOrderChanged() {
            const rowIds = this.data.map(row => row.id);
            document.getElementById('rowSortResult').textContent = '当前顺序：' + rowIds.join('、');
        }

        function onSaveToDBClick() {
            // 提交行 ID 的排列，刷新时按这组 ID 重新读取学生数据。
            const rowIds = F('<%= Grid1.ClientID %>').data.map(row => row.id);
            F.customEvent('Grid1_RowSort', {
                rowIds: rowIds
            });
        }

        function onRefreshClick() {
            window.location.reload();
        }

    </script>
</body>
</html>
