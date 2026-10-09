<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_empty_text_fewcolumns.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_empty_text_fewcolumns" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .grid-empty-text {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 500px;
            margin-left: -250px;
            margin-top: -15px;

            font-size: 24px;
            text-align: center;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="350px" runat="server">
            <Columns>
                <f:RowNumberField Width="60px" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Hidden="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Hidden="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Hidden="true" HeaderText="所学专业" Width="200px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" Hidden="true" Width="150px" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField Hidden="true" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        注：初始隐藏了很多列，使得表格的宽度不足以放得下空信息，所以将空信息绝对定位。
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
