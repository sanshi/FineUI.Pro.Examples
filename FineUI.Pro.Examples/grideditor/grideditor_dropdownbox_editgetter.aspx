<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_dropdownbox_editgetter.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_dropdownbox_editgetter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（进入编辑状态后，从下拉表格中选择用户）" EnableCollapse="false"
            Height="350px" runat="server" AllowCellEditing="true" ClicksToEdit="1">
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
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" EditGetterFunction="editGetterName" EditSetterFunction="editSetterName">
                    <Editor>
                        <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请选择" MatchFieldWidth="false" EnableMultiSelect="false">
                            <PopPanel>
                                <f:Grid ID="Grid2" ShowBorder="true" ShowHeader="false" runat="server" DataIDField="Id" DataTextField="Name" Hidden="true"
                                    Width="650px" Height="300px" EnableMultiSelect="false">
                                    <Columns>
                                        <f:RowNumberField />
                                        <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                                        <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                                        </f:RenderField>
                                        <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                                        <f:RenderField ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date"
                                            RendererArgument="yyyy/MM/dd" HeaderText="入学日期" />
                                        <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                                        <f:RenderField ColumnID="Major" DataField="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" />
                                    </Columns>
                                    <Listeners>
                                        <f:Listener Event="rowclick" Handler="onGrid2RowClick" />
                                    </Listeners>
                                </f:Grid>
                            </PopPanel>
                        </f:DropDownBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Code" DataField="Code" HeaderText="编码">
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
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy/MM/dd"
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
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
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
                    "EntranceYear": "2000",
                    "EntranceDate": "2000-09-01",
                    "AtSchool": false,
                    "Major": "未知"
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


        var grid1ClientID = '<%= Grid1.ClientID %>';
        var grid2ClientID = '<%= Grid2.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        // 自定义编辑器获取函数（从Editor返回单元格）
        function editGetterName(editor) {
            return editor.getText();
        }

        // 自定义编辑器设置函数（从单元格进入Editor）
        function editSetterName(editor, val, columnId, rowId) {
            var grid1 = F(grid1ClientID);
            var rowValue = grid1.getRowValue(rowId);
            var rowCode = rowValue['Code'];

            editor.setValue(rowCode, val);
        }


        function onGrid2RowClick(event, grid2RowId) {
            var grid1 = F(grid1ClientID);
            var grid1RowId = grid1.getSelectedCell()[0];
            var rowValue = this.getRowValue(grid2RowId);

            grid1.updateCellValue(grid1RowId, {
                'Code': grid2RowId,
                'Name': rowValue.Name,
                'Gender': rowValue.Gender,
                'EntranceYear': rowValue.EntranceYear,
                'EntranceDate': rowValue.EntranceDate,
                'AtSchool': rowValue.AtSchool,
                'Major': rowValue.Major
            });

        }

    </script>
</body>
</html>
