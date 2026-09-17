<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_disabled.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="禁用行命令" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="Actions" Width="110px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="Action1" Enabled="false" Icon="Pencil" ToolTip="在页面标签中禁用" />
                        <f:Command CommandName="Action2" IconFont="_Pencil" ToolTip="在 Page_Load 中通过 FindCommand 禁用" />
                        <f:Command CommandName="Action3" Icon="Delete" ToolTip="可用命令" ConfirmText="你确定要这么做吗？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />前两个命令分别由标签和服务端 <code>FindCommand</code> 禁用。<br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
</body>
</html>
