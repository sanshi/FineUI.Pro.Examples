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
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（双击编辑）" EnableCollapse="false"
            runat="server" AllowCellEditing="true" ClicksToEdit="2"
            DataIDField="Id" EnableCheckBoxSelect="true">
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
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                    <Editor>
                        <f:NumberBox ID="tbxEditorEntranceYear" NoDecimal="true" NoNegative="true" MinValue="2000"
                            MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="入学日期">
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
                <f:LinkButtonField ColumnID="Delete" Icon="Delete" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        注：本示例通过客户端脚本注册新增行、删除行和重置数据事件。
        <br />
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
                'Delete': '<a href="#"><img src="../res/icon/delete.png"/></a>'
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
                ok: function () {
                    // 删除选中行
                    grid.deleteSelectedRows();
                }
            });
        }


        function onResetClick(event) {
            F.confirm({
                message: '确定要重置表格数据？',
                ok: function () {
                    F(grid1ClientID).rejectChanges();
                }
            });
        }


        F.ready(function () {

            var grid = F(grid1ClientID);
            // 注册点击行中删除图片的事件处理函数
            grid.el.on('click', '.f-grid-cell-Delete a', function (event) {
                event.preventDefault();
                // 删除选中行之前先弹出确认对话框
                F.confirm({
                    message: '删除选中行？',
                    ok: function () {
                        // 删除选中行
                        grid.deleteSelectedRows();
                    }
                });
            });

        });

    </script>
</body>
</html>
