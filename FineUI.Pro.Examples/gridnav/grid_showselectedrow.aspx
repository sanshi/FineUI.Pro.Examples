<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_showselectedrow.aspx.cs" Inherits="FineUI.Pro.Examples.gridnav.grid_showselectedrow" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            ShowSelectedCell="true" ShowSelectedRow="false" EnableRowHoverState="false">
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
        注：
        <ul>
            <li>方向键改变选中的单元格</li>
            <li>Tab键转到当前行的下一个单元格（如果当前位于某一行的最后一个单元格，则会跳转到下一行的第一个单元格）</li>
            <li>Shift+Tab键回退到当前行的上一个单元格（如果当前位于某一行的第一个单元格，则会跳转到上一行的最后一个单元格）</li>
            <li>ShowSelectedRow=false：禁用表格行的选中样式</li>
            <li>EnableRowHoverState=false：禁用表格行的鼠标焦点样式</li>
        </ul>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
