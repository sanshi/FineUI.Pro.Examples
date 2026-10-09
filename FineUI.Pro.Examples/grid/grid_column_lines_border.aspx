<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_column_lines_border.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_column_lines_border" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mygrid .f-grid-colheader.f-last {
            border-right-width: 1px;
        }

        .mygrid .f-grid-colheader.f-last .f-grid-colheader-trigger.f-state-hover {
            border-right-width: 0;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" CssClass="mygrid" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableColumnLines="true"
            EnableCheckBoxSelect="true">
            <Columns>
                <f:RowNumberField Width="60px" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" Width="200px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" Width="150px" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
