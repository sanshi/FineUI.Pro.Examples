<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_client_validate.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_client_validate" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（双击编辑）" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="2">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onNewClick">
                        </f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" runat="server" ClickHandler="onDeleteClick">
                        </f:Button>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
                        <f:Button ID="btnReset" Text="重置表格数据" runat="server" ClickHandler="onResetClick">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" runat="server">
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
                <f:RenderField ColumnID="Delete" Width="50px" TextAlign="Center" EnableHeaderMenu="false">
                    <Commands>
                        <f:Command CommandName="Delete" Icon="Delete" ConfirmText="删除选中行？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" ClickHandler="onValidateClick" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        // 删除工具栏中选中的行（先确认）。
        function deleteSelectedRows() {
            F.confirm({
                message: '删除选中行？',
                messageIcon: 'question',
                ok: function() {
                    F(Grid1ClientID).deleteSelectedRows(false);
                }
            });
        }

        function onNewClick(event) {
            F(Grid1ClientID).addNewRecord({
                    "Name": "",
                    "Gender": "1",
                    "EntranceYear": "2015",
                    "EntranceDate": "2015-09-01",
                    "AtSchool": false,
                    "Major": "化学系"
                },
                true);
        }

        function onGrid1RowCommand(event, rowId, rowIndex, columnId, commandName) {
            if (commandName === 'Delete') {
                F(Grid1ClientID).deleteRow(rowId);
            }
        }

        function onDeleteClick(event) {
            if (!F(Grid1ClientID).hasSelection()) {
                F.alert({
                    message: '请至少选择一项！',
                    messageIcon: 'information'
                });
                return false;
            }
            deleteSelectedRows();
        }

        function onResetClick(event) {
            F.confirm({
                message: '确定要重置表格数据？',
                ok: function() {
                    F(Grid1ClientID).rejectChanges();
                },
                messageIcon: 'question'
            });
        }


        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function isValid() {
            var grid1 = F('<%= Grid1.ClientID %>');
            var valid = true,
                modifiedData = grid1.getModifiedData();

            $.each(modifiedData, function(index, rowData) {

                // rowData.id: 行ID
                // rowData.status: 行状态（newadded, modified, deleted）
                // rowData.values: 行中修改单元格对象，比如 { "Name": "刘国2", "Gender": 0, "EntranceYear": 2003 }
                if (rowData.status === 'deleted') {
                    return true; // continue
                }

                var name = rowData.values['Name'];
                // 更改了姓名列，并且为空字符串
                // 如果typeof(name)=='undefined'，则表示姓名没有更改，需要排除在外！！
                if (typeof(name) != 'undefined' && $.trim(name) == '') {
                    F.alert({
                        message: '姓名不能为空！',
                        ok: function() {
                            grid1.startEdit(rowData.id, 'Name');
                        }
                    });

                    valid = false;

                    return false; // break
                }
            });


            return valid;
        }




        function onValidateClick(event) {
            // 自定义校验：返回 false 取消后续的确认框与服务端回发
            return isValid();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>提交前检查本轮新增与修改记录的姓名，空姓名时停止提交并重新进入该单元格。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>验证失败后回到问题单元格</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnNew").ClientID %>'
                        title="新增数据">新增数据</strong>，将新行<strong>姓名</strong>清空并结束编辑。<br />结果：新行暂时保留空<strong>姓名</strong>，等待提交前的统一验证。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="保存数据">保存数据</strong>。<br />结果：浏览器提示<strong>姓名</strong>不能为空，停止本次保存；关闭提示后重新进入对应<strong>姓名</strong>编辑器。</li>
                <li>填写<strong>姓名</strong><code>新学生</code>并再次保存。<br />结果：验证通过后才提交，后台读取本轮变更并更新示例数据。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>getModifiedData / startEdit</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（双击编辑）">表格（双击编辑）</strong>）：检查待保存记录，跳过删除项；<strong>姓名</strong>为空时停止提交，并重新打开该行<strong>姓名</strong>编辑器。</li>
                <li><code>Required / 提交前验证</code>（<strong>姓名编辑器与保存处理</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（双击编辑）">表格（双击编辑）</strong>）：编辑器必填验证用于正在编辑的输入；新增记录尚未逐格编辑时仍可能有空<strong>姓名</strong>，因此提交前还要统一检查待保存数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
