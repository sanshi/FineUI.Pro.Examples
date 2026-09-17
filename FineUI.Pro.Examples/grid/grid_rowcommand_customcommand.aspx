<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_customcommand.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_customcommand" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="客户端与服务端行命令" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField ColumnID="Actions" Width="110px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="Action0" IconFont="_Info" ToolTip="只执行客户端命令" />
                        <f:Command CommandName="Action1" Icon="Pencil" ToolTip="执行服务端命令" CommandArgument="Edit" />
                        <f:Command CommandName="Action3" Icon="Delete" ToolTip="确认后执行服务端命令" ConfirmText="你确定要这么做吗？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
    <script>
        function onGrid1RowCommand(event, rowId, rowIndex, columnId, commandName) {
            if (commandName === 'Action0') {
                F.alert('这是客户端命令，已阻止服务端 RowCommand。');
                return false;
            }
        }

    </script>
</body>
</html>
