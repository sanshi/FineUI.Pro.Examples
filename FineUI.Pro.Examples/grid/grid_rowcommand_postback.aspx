<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_postback.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_postback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="最小服务端 RowCommand" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="Actions" Width="60px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="Delete" CommandArgument="Minimal" Icon="Delete" ConfirmText="你确定要这么做吗？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />页面没有客户端 rowcommand Listener，Grid 会自动桥接服务端事件。<br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
</body>
</html>
