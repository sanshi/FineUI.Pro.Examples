<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_multi_commands_textalign.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_multi_commands_textalign" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" runat="server" IsFluid="true" Title="多命令对齐" ShowBorder="true" ShowHeader="true" EnableColumnLines="true" DataIDField="Id"
            DataKeyNames="Id,Name" OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" ExpandUnusedSpace="true" />
                <f:RenderField ColumnID="LeftActions" Width="90px" TextAlign="Left" HeaderText="左对齐">
                    <Commands>
                        <f:Command CommandName="LeftEdit" Icon="Pencil" />
                        <f:Command CommandName="LeftDelete" Icon="Delete" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="CenterActions" Width="90px" TextAlign="Center" HeaderText="居中">
                    <Commands>
                        <f:Command CommandName="CenterEdit" Icon="Pencil" />
                        <f:Command CommandName="CenterDelete" Icon="Delete" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="RightActions" Width="90px" TextAlign="Right" HeaderText="右对齐">
                    <Commands>
                        <f:Command CommandName="RightEdit" Icon="Pencil" />
                        <f:Command CommandName="RightDelete" Icon="Delete" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server" />
    </form>
</body>
</html>
