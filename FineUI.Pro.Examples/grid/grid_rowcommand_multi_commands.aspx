<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_multi_commands.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_multi_commands" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="同列多个行命令" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="Actions" Width="90px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="Edit" IconFont="_Pencil" ToolTip="编辑" CommandArgument="Form" />
                        <f:Command CommandName="Delete" IconFont="_Close" IconFontClass="text-danger" ToolTip="删除" ConfirmText="删除本行？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
</body>
</html>
