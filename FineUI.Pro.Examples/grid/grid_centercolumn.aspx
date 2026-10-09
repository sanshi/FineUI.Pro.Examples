<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_centercolumn.aspx.cs"
    Inherits="FineUI.Pro.Examples.data.grid_centercolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="false">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="150px" TextAlign="Center" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校（居中）" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业（居中）" TextAlign="Center" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major"
                    RendererFunction="renderMajor" />
                <f:RenderField Width="250px" ColumnID="Group" TextAlign="Right" HeaderTextAlign="Left" HeaderText="分组（内容靠右，标题靠左）" DataField="Group"
                    RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
