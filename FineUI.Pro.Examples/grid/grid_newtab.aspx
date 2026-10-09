<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_newtab.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_newtab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_newtab_window.aspx" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" DataTextField="Name" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            PageSize="3" runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onNewClick">
                        </f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" OnClick="btnDelete_Click" runat="server" ClickHandler="onDeleteClick">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField HeaderText="新标签页打开">
                    <Commands>
                        <f:Command CommandName="Edit" Text="编辑" />
                    </Commands>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        注：本目录中的示例仅在主选项卡标签为[多标签页]时有效。
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        function onNewClick(event) {
            parent.addExampleTab({
                id: 'grid_newtab_addnew',
                title: '新增人员',
                iframeUrl: '<%= ResolveUrl("~/grid/grid_newtab_window.aspx") %>',
                refreshWhenExist: true,
                iconFont: 'plus'
            });
        }

        function onDeleteClick(event) {
            if (!F(Grid1ClientID).hasSelection()) {
                F.alert({
                    message: '至少选择一项！',
                    messageIcon: 'information'
                });
                return false;
            };
        }

        function openNewTab(rowId) {
            var rowData = F(Grid1ClientID).getRowData(rowId);
            var id = rowData.id;
            var name = rowData.text;

            parent.addExampleTab({
                id: 'grid_newtab_edit_' + id,
                title: '编辑 - ' + name,
                iframeUrl: F.formatString('{0}?id={1}&name={2}', '<%= ResolveUrl("~/grid/grid_newtab_window.aspx") %>', id, F.urlEncode(name)),
                refreshWhenExist: true,
                iconFont: 'pencil'
            });
        }

        function onGrid1RowCommand(event, rowId, rowIndex, columnId, commandName) {
            if (commandName === 'Edit') {
                openNewTab(rowId);
            }
        }

    </script>
</body>
</html>
