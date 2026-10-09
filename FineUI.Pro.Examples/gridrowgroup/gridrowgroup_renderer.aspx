<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_renderer.aspx.cs" Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_renderer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" RowGroupRendererFunction="onGrid1RowGroupRenderer">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onGrid1RowGroupRenderer(groupValue, rowData) {
            var maleCount = 0,
                total = rowData.children.length;
            for (var i = 0; i < total; i++) {
                var childData = rowData.children[i];
                var genderVaue = childData.values['Gender'];
                if (String(genderVaue) === '1') {
                    maleCount++;
                }
            }
            return F.formatString('入学年份：{0}，男：{1}，女：{2}', groupValue, maleCount, total - maleCount);
        }

    </script>
</body>
</html>
