<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_lockcolumn.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_lockcolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id" DataUrl="~/griddataurl/griddataurl.ashx" AllowColumnLocking="true">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField EnableLock="true" Locked="true" ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField EnableLock="true" ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField EnableLock="true" ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField EnableLock="true" ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField EnableLock="true" ColumnID="Major" DataField="Major" RendererFunction="renderMajor"
                    Width="400px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField EnableLock="true" ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
    </form>
    <script src="../res/js/grid.js"></script>
</body>
</html>
