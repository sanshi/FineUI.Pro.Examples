<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_updatecellvalue_noedit.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_updatecellvalue_noedit" %>

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
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="ChineseScore" DataField="ChineseScore" FieldType="Int" HeaderText="语文成绩">
                    <Editor>
                        <f:NumberBox ID="TextBox1" NoDecimal="true" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="MathScore" DataField="MathScore" FieldType="Int" HeaderText="数学成绩">
                    <Editor>
                        <f:NumberBox ID="NumberBox1" NoDecimal="true" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="TotalScore" DataField="TotalScore" FieldType="Int" HeaderText="总成绩（不可编辑）">
                </f:RenderField>
                <f:RenderField ColumnID="Delete" Width="50px" TextAlign="Center" EnableHeaderMenu="false">
                    <Commands>
                        <f:Command CommandName="Delete" Icon="Delete" ConfirmText="删除选中行？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="afteredit" Handler="onGridAfterEdit" />
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
                    "ChineseScore": 0,
                    "MathScore": 0,
                    "TotalScore": 0
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


        function onGridAfterEdit(event, value, params) {
            var me = this,
                columnId = params.columnId,
                rowId = params.rowId;
            if (columnId === 'ChineseScore' || columnId === 'MathScore') {
                var chineseScore = me.getCellValue(rowId, 'ChineseScore');
                var mathScore = me.getCellValue(rowId, 'MathScore');

                // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                me.updateCellValue(rowId, {
                    TotalScore: chineseScore + mathScore
                });

            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>修改语文或数学成绩后，立即更新同一行的总成绩，总成绩列只显示计算结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>用两科成绩重算总成绩</h3>
            <ol>
                <li>双击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（双击编辑）">表格（双击编辑）</strong>某行<strong>语文成绩</strong>，输入<code>90</code>，再结束编辑。<br />结果：浏览器读取该行当前<strong>数学成绩</strong>，总成绩立即显示 90
                    加<strong>数学成绩</strong>的结果。</li>
                <li>尝试双击同一行的总成绩。<br />结果：总成绩没有编辑器，不能直接键入；它仍可由脚本更新。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>afteredit / getCellValue / updateCellValue</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（双击编辑）">表格（双击编辑）</strong>）：在单科结束编辑后读取同一行的两科值，以 TotalScore 列标识更新合计，不需要打开目标编辑器。</li>
                <li><code>Editor</code>（<strong>总成绩列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（双击编辑）">表格（双击编辑）</strong>）：不配置编辑器，保留脚本更新计算结果的能力。</li>
            </ul>
        </section>
    </template>
</body>
</html>
