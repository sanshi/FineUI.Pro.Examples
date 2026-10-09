<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_mergecells.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_mergecells" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            EnableColumnLines="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="ID" DataField="Id" HeaderText="ID" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField Hidden="true" ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业" />
                <f:RenderField ColumnID="Group" HeaderText="分组A" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="GroupB" HeaderText="分组B" DataField="GroupB" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        注：单元格合并和行扩展列不能同时存在（行扩展列时表格的每一行都是table结构）！
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onGridDataLoad(event) {
            this.mergeCells([{
                rowId: '101',
                columnId: 'EntranceYear',
                rowspan: 3
            }, {
                rowId: '102',
                columnId: 'Major',
                rowspan: 3
            }, {
                rowId: '109',
                columnId: 'Group',
                rowspan: 4,
                colspan: 2
            }]);
        }

    </script>
</body>
</html>
