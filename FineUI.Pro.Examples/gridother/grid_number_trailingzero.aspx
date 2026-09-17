<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_number_trailingzero.aspx.cs" Inherits="FineUI.Pro.Examples.gridother.grid_number_trailingzero" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（尾零省略）" runat="server" EnableCollapse="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别"></f:RenderField>
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
                <f:RenderField Width="150px" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="入学日期"></f:RenderField>
                <f:RenderField Width="160px" DataField="Salary" HeaderText="工资（千分位，尾零省略）" FieldType="Double" Renderer="Number" RendererArgument="N2" TrimZero="true" />
                <f:RenderField Width="150px" DataField="GPA" HeaderText="绩点（定点数，尾零省略）" FieldType="Double" Renderer="Number" RendererArgument="F2" TrimZero="true" />
                <f:RenderField Width="160px" DataField="AttendanceRate" HeaderText="出勤率（百分比，尾零省略）" FieldType="Double" Renderer="Number" RendererArgument="P2" TrimZero="true" />
                <f:RenderField Width="175px" DataField="ResearchFund" HeaderText="科研经费（科学计数法，尾零省略）" FieldType="Double" Renderer="Number" RendererArgument="E2" TrimZero="true" />
            </Columns>
        </f:Grid>
    </form>
    <script src="../res/js/gridcard.js"></script>
</body>
</html>
