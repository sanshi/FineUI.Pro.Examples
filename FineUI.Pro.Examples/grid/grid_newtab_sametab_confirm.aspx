<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_newtab_sametab_confirm.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_newtab_sametab_confirm" %>

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
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        function onNewClick(event) {
            parent.addExampleTab({
                id: 'grid_newtab_sametab_addnew',
                title: '新增人员',
                iframeUrl: '<%= ResolveUrl("~/grid/grid_newtab_window.aspx") %>',
                // 标签页已经打开时不作处理（不刷新）
                refreshWhenExist: false,
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
                id: 'grid_newtab_sametab_edit',
                title: '编辑 - ' + name,
                iframeUrl: F.formatString('{0}?id={1}&name={2}', '<%= ResolveUrl("~/grid/grid_newtab_window.aspx") %>', id, F.urlEncode(name)),
                refreshWhenExist: false,
                confirmWhenExist: '当前标签页已经打开，确认放弃修改？',
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
            <p>复用同一个编辑页签前先确认是否放弃原页内容，避免直接覆盖正在编辑的记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>替换编辑页前先确认</h3>
            <ol>
                <li>在框架主页面打开本例，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>某行的编辑入口，再打开另一条记录。<br />结果：已有编辑页签时先询问是否放弃，确认后才改用新记录；取消则保留原编辑页。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>addExampleTab / id</code>（<strong>框架页签调用</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：通过框架页面提供的函数打开页签，id
                    决定复用哪一个标签；本例需要在框架中操作。</li>
                <li><code>refreshWhenExist / confirmWhenExist</code>（<strong>编辑页签配置</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：行内编辑的 refreshWhenExist 初始为
                    <code>false</code>，配合确认文字，已打开时经确认才更新；新增入口不设置确认文字，已存在时保留原页。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
