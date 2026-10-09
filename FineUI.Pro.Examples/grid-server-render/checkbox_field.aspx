<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkbox_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.checkbox_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>复选框列：状态与回发</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="复选框列：状态与回发"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:CheckBoxField ColumnID="StaticCheck" DataField="AtSchool" HeaderText="静态状态" RenderAsStaticField="true" />
                <f:CheckBoxField ColumnID="EditableCheck" DataField="AtSchool" HeaderText="点击后回发" RenderAsStaticField="false" CommandName="Check" />
            </Columns>
        </f:Grid>
        <p>CheckBoxField 保存每行复选框的服务端状态，点击后触发行命令；新项目优先使用 RenderCheckField。</p>
        <f:Label ID="labResult" runat="server" />
    </form>
</body>
</html>
