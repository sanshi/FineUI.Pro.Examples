<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_clicktoselectrow.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_clicktoselectrow" %>

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
            EnableCheckBoxSelect="true" OnRowCommand="Grid1_RowCommand" EnableRowClickEvent="true" OnRowClick="Grid1_RowClick">
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
                        <f:Command CommandName="Action1" Text="按钮1" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Action2" Width="60px" TextAlign="Center">
                    <Commands>
                        <f:Command CommandName="Action2" Text="按钮2" CssClass="prevent-row-select" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        注：
        <ul>
            <li>
                [按钮1]：点击时会同时触发RowCommand和RowClick事件，同时选中行。
            </li>
            <li>
                [按钮2]：点击时只会触发RowCommand事件，不会选中行。
            </li>
        </ul>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onBeforeRowClick(event, rowId) {
            return !$(event.target).closest('.prevent-row-select').length;
        }
        F.ready(function() {
            F('<%= Grid1.ClientID %>').on('beforerowclick', onBeforeRowClick);
        });

    </script>
</body>
</html>
