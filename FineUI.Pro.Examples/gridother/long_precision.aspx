<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="long_precision.aspx.cs" Inherits="FineUI.Pro.Examples.gridother.long_precision" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id">
            <Columns>
                <f:RowNumberField />
                <%--<f:RenderField DataField="Id" Width="200px" HeaderText="Id" />--%>
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别"></f:RenderField>
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
                <f:RenderField Width="150px" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="入学日期"></f:RenderField>
            </Columns>
        </f:Grid>

    </form>
    <script src="../res/js/gridcard.js"></script>
</body>
</html>
