<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_width_forcefit_minwidth.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_width_forcefit_minwidth" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" ShowBorder="true" Margin="24px" ShowHeader="true"
            Title="表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)（注意对比[性别]和[姓名]列的区别）" ForceFit="true" runat="server" MinColumnWidth="50px">
            <Columns>
                <f:RowNumberField />
                <f:RenderField MinWidth="100px" MaxWidth="150px" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="300px" MinWidth="100px" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField Width="600px" MinWidth="100px" DataField="Desc" HeaderText="个人简介" RendererFunction="renderTooltip1" />
            </Columns>
        </f:Grid>
        <br />
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function renderTooltip1(value, params) {
            return $('<span>').text(value).attr('data-qtip', F.htmlEncode(value));
        }

    </script>
</body>
</html>
