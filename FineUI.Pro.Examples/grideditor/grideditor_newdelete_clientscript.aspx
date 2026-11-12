<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_newdelete_clientscript.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_newdelete_clientscript" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（双击编辑）" EnableCollapse="false" runat="server" AllowCellEditing="true"
            ClicksToEdit="2" DataIDField="Id" EnableCheckBoxSelect="true">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onNewClick"></f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" runat="server" ClickHandler="onDeleteClick"></f:Button>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
                        <f:Button ID="btnReset" Text="重置表格数据" runat="server" ClickHandler="onResetClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                    <Editor>
                        <f:NumberBox ID="tbxEditorEntranceYear" NoDecimal="true" NoNegative="true" MinValue="2000" MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="入学日期">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Delete">
                    <Commands>
                        <f:Command RendererFunction="renderClientAction" Icon="Delete" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br /><br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />

    </form>
    <script>
        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        var grid1ClientID = '<%= Grid1.ClientID %>';

        function onNewClick(event) {
            F(grid1ClientID).addNewRecord({
                'Name': '',
                'Gender': 1,
                'EntranceYear': '2015',
                'EntranceDate': '2015-09-01',
                'AtSchool': false,
                'Major': '化学系',
                'Delete': ''
            }, false);
        }

        function onDeleteClick(event) {
            var grid = F(grid1ClientID);

            // 如果没有选中项，弹出提示信息
            if (!grid.hasSelection()) {
                F.alert('请至少选择一项！');
                return;
            }

            // 删除选中行之前先弹出确认对话框
            F.confirm({
                message: '删除选中行？',
                ok: function() {
                    // 删除选中行
                    grid.deleteSelectedRows();
                }
            });
        }


        function onResetClick(event) {
            F.confirm({
                message: '确定要重置表格数据？',
                ok: function() {
                    F(grid1ClientID).rejectChanges();
                }
            });
        }


        F.ready(function() {

            var grid = F(grid1ClientID);
            // 注册点击行中删除图片的事件处理函数
            grid.el.on('click', '.f-grid-cell-Delete a', function(event) {
                event.preventDefault();
                // 删除选中行之前先弹出确认对话框
                F.confirm({
                    message: '删除选中行？',
                    ok: function() {
                        // 删除选中行
                        grid.deleteSelectedRows();
                    }
                });
            });

        });

    </script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>先在浏览器新增、删除和编辑记录，再统一保存或撤回本轮未提交变更。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>登记增删改并统一保存</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnNew").ClientID %>'
                        title="新增数据">新增数据</strong>，填写新记录需要的内容。<br />结果：表格出现一条临时新增记录，可以继续编辑；此时尚未写入后台。</li>
                <li>选中一条记录，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDelete").ClientID %>'
                        title="删除选中行">删除选中行</strong>并确认。<br />结果：浏览器将它登记为待删除并从当前显示中移除；新增行、删除行和普通修改在本轮分别跟踪。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="保存数据">保存数据</strong>。<br />结果：后台读取本轮变更，分别应用新增、修改与删除，再重新绑定示例数据，浏览器中的变更标记随绑定清除。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>撤回尚未保存的变化</h3>
            <ul>
                <li>在保存前点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnReset").ClientID %>'
                        title="重置表格数据">重置表格数据</strong>并确认。<br />结果：通过客户端撤销恢复上次绑定的状态，未保存的新增和编辑被丢弃，待删除的原记录恢复；已保存到后台的数据不被这个操作回滚。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>addNewRecord</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（双击编辑）">表格（双击编辑）</strong>）：在浏览器创建待新增记录并提供初始字段值，保存前保留新增状态。</li>
                <li><code>deleteSelectedRows</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（双击编辑）">表格（双击编辑）</strong>）：登记所选记录的删除，最终处理由本页的保存逻辑决定。</li>
            </ul>
        </section>
    </template>
</body>
</html>
