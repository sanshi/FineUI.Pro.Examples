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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>从行内编辑入口打开相应记录页签，用不同记录标识区分编辑页。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>按页签标识打开记录</h3>
            <ol>
                <li>在框架主页面打开本例，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>某行的编辑入口，再打开另一条记录。<br />结果：每条记录使用自己的编辑页签标识；同一记录已打开时复用对应页签，不把另一条记录内容混入。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本目录中的示例仅在主选项卡标签为[多标签页]时有效。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>addExampleTab / id</code>（<strong>框架页签调用</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：通过框架页面提供的函数打开页签，id
                    决定复用哪一个标签；本例需要在框架中操作。</li>
            </ul>
        </section>
    </template>
</body>
</html>
