<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="linkbutton_field.aspx.cs" Inherits="FineUI.Pro.Examples.grid_server_render.linkbutton_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>链接按钮列：行命令与确认</title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" DataIDField="Id" DataKeyNames="Id,Name" IsFluid="true" ShowHeader="true" Title="链接按钮列：行命令与确认"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:LinkButtonField ColumnID="Action" HeaderText="行命令" Text="执行" CommandName="Execute" ConfirmText="执行当前行的操作？" />
            </Columns>
        </f:Grid>
        <p>LinkButtonField 将点击转换为服务端行命令，并支持确认提示；新项目优先使用 RenderField.Commands。</p>
        <f:Label ID="labResult" runat="server" />
    </form>
</body>
</html>
