<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_vertical_tab.aspx.cs" Inherits="FineUI.Pro.Examples.gridnav.grid_vertical_tab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            ShowSelectedCell="true" ShowSelectedRow="false" EnableRowHoverState="false" TabVerticalNavigate="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        快捷键说明：
        <ul>
            <li>方向键在单元格之间导航</li>
            <li>设置 TabVerticalNavigate=true 之后，Tab键在垂直方向上导航：
                <ul>
                    <li>Tab键转到当前列的下一个单元格（如果当前位于某一列的最后一个单元格，则会跳转到下一列的第一个单元格）</li>
                    <li>Shift+Tab键回退到当前列的上一个单元格（如果当前位于某一列的第一个单元格，则会跳转到上一列的最后一个单元格）</li>
                </ul>
            </li>
        </ul>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
