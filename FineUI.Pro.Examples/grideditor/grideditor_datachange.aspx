<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_datachange.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_datachange" %>

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
                <f:Listener Event="datachange" Handler="checkSubmitBtnStatus" />
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" Enabled="false" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        注：
        <ul>
            <li>[保存数据]按钮默认禁用，当有数据变化时（删除行，新增行，修改单元格）启用</li>
            <li>数据重新绑定后，重新检查[保存数据]按钮的启用状态</li>
        </ul>

    </form>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        // 删除表格中选中的行（先确认）。
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

        var gridClientID = '<%= Grid1.ClientID %>';
        var btnClientID = '<%= Button2.ClientID %>';

        function checkSubmitBtnStatus(event) {
            var grid = F(gridClientID);
            var submitBtn = F(btnClientID);

            // 如果没有删除行，没有新增行，没有修改的数据
            if (!grid.getModifiedData().length) {
                submitBtn.disable();
            } else {
                submitBtn.enable();
            }
        }


        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

    </script>
</body>
</html>
