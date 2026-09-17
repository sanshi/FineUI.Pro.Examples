<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_hide_some.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_hide_some" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-command.hide-command {
            visibility: hidden;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="按行隐藏命令" ShowBorder="true" ShowHeader="true" DataIDField="Id" DataKeyNames="Id,Name"
            OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderField ColumnID="Actions" Width="80px" TextAlign="Center" HeaderText="操作">
                    <Commands>
                        <f:Command CommandName="Action1" Icon="Pencil" RendererFunction="renderAction1Hidden" />
                        <f:Command CommandName="Action3" Icon="Delete" ConfirmText="你确定要这么做吗？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />入学年份为 2008 的编辑命令被隐藏。<br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
    <script>
        function renderAction1Hidden(value, params) {
            if (params.rowData.values.EntranceYear == 2008) {
                return $(value).addClass('hide-command');
            }
        }

    </script>
</body>
</html>
