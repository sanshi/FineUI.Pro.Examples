<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowcommand" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell-Deleteit .f-icon {
            color: red;
            font-weight: bold;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" DataKeyNames="Id,Name" OnRowCommand="Grid1_RowCommand">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Hidden="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" Hidden="true" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="Action1" Width="60px" TextAlign="Center">
                    <Commands>
                        <f:Command CommandName="Action1" Text="按钮" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Action2" Width="60px" TextAlign="Center">
                    <Commands>
                        <f:Command CommandName="Action2" Icon="Delete" ConfirmText="你确定要这么做么？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Deleteit" Width="60px" TextAlign="Center">
                    <Commands>
                        <f:Command CommandName="Action3" IconFont="_Close" ConfirmText="确定要删除本行？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
