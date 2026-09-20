<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="long_precision.aspx.cs" Inherits="FineUI.Pro.Examples.gridother.long_precision" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（Id 完整）" runat="server" EnableCollapse="false" DataIDField="Id" DataTextField="Name">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Id" Width="200px" HeaderText="Id" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别"></f:RenderField>
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
                <f:RenderField Width="150px" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="入学日期"></f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：Id 在数据库中的实际值是 21956392701267968（17 位，超过 JavaScript 能精确表示的整数范围）。FineUI.Pro 在服务器端渲染表格单元格的值和行标识时统一转为字符串，所以 Id 列原样显示，无需额外配置；而在浏览器端直接书写这个数字，读出来就是 21956392701267970。
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
