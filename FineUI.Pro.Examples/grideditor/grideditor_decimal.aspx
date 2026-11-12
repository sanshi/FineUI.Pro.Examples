<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_decimal.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_decimal" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="1">
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
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="ChineseScore" DataField="ChineseScore" FieldType="Float" HeaderText="语文成绩">
                    <Editor>
                        <f:NumberBox ID="nbChineseScore" NoDecimal="false" NoNegative="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="MathScore" DataField="MathScore" FieldType="Float" HeaderText="数学成绩">
                    <Editor>
                        <f:NumberBox ID="nbMathScore" NoDecimal="false" NoNegative="true" runat="server">
                        </f:NumberBox>
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
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
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
                    "Name": "新用户",
                    "Gender": "1",
                    "Major": "化学系",
                    "ChineseScore": "",
                    "MathScore": ""
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

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>允许小数成绩和空值，并通过新增、删除与撤销操作管理本轮待保存的记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>编辑小数成绩</h3>
            <ol>
                <li>单击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>语文成绩</strong>并输入<code>88.5</code>，再结束编辑。<br />结果：单元格保留
                    88.5，不截断为整数；<strong><strong>数学成绩</strong></strong>可按相同方式填写小数。</li>
                <li>将一个成绩单元格清空，再点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="保存数据">保存数据</strong>。<br />结果：后台读取本轮修改，将空值与小数写回示例数据并重新绑定，下方显示提交的修改明细。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>新增、删除与撤销待保存修改</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnNew").ClientID %>'
                        title="新增数据">新增数据</strong>，填写新行需要的资料与成绩。<br />结果：浏览器增加临时记录，初始<strong>姓名</strong>为新用户、成绩为空，等待保存时一并提交。</li>
                <li>选中一行，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDelete").ClientID %>'
                        title="删除选中行">删除选中行</strong>并确认。<br />结果：该行从浏览器中移除并记为待删除，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="保存数据">保存数据</strong>后才由后台应用到示例数据。</li>
                <li>在保存前点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnReset").ClientID %>'
                        title="重置表格数据">重置表格数据</strong>并确认。<br />结果：本轮新增、删除与编辑全部撤回，恢复上次绑定的记录；已保存到后台的数据不会被这个客户端撤销操作回滚。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>成绩可以为小数</li>
                <li>默认[刘国]和[康颖颖]的成绩未定义（DBNull.Value）</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>NoDecimal</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("nbChineseScore").ClientID %>'
                        title="语文成绩列的数字输入框">语文成绩列的数字输入框</strong>）：初始为 <code>false</code>，允许输入小数成绩。</li>
                <li><code>FieldType</code>（<strong>语文、数学成绩列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：成绩列使用浮点数类型读取和提交，避免按整数解释小数。</li>
                <li><code>addNewRecord / deleteSelectedRows / rejectChanges</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：分别创建待新增记录、登记待删除记录及撤回未提交的变更，后台统一通过修改数据处理保存。</li>
            </ul>
        </section>
    </template>
</body>
</html>
