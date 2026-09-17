<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_delete.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_delete" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（双击编辑）" EnableCollapse="false"
            runat="server" DataIDField="Id" AllowCellEditing="true" ClicksToEdit="2"
            OnRowCommand="Grid1_RowCommand" EnableCheckBoxSelect="true">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnDelete" Text="删除选中行（可删除多行）" Icon="Delete" runat="server" ClickHandler="onDeleteButtonClick"></f:Button>
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
                <f:LinkButtonField ColumnID="Delete" ConfirmText="删除选中行？" ConfirmTarget="Top" Text="删除"
                    CommandName="Delete" Icon="Delete" />
            </Columns>
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

        // 控件都在命名容器里，客户端 id 带前缀，必须由服务端输出 ClientID，不能写字面 id
        var gridClientID = '<%= Grid1.ClientID %>';

        // 选中行数只有浏览器知道，所以在这里拼；<b> 是我们自己写的可信 HTML，用 F.rawHtml 原样输出。
        // 客户端已经拿着选中行的标识，用自定义回发直接送到服务端，不必让服务端再从回发状态里反推。
        // （确认框是异步的，没法在这个函数里等用户点完，所以先 return false，点确定后由 ok 回调发起回发。
        //   自定义回发不带表单验证、回发前禁用按钮这些按钮内置回发才有的特性，需要的话在这里自己写。）
        function onDeleteButtonClick(event) {
            var grid = F(gridClientID);
            if (!grid.hasSelection()) { F.alert('请至少选择一项！'); return false; }

            var selectedRows = grid.getSelectedRows();
            F.confirm({
                message: F.rawHtml('你确定要删除选中的&nbsp;<b>' + selectedRows.length + '</b>&nbsp;行数据吗？'),
                messageIcon: 'warning',
                ok: function () {
                    F.customEvent('Grid1_DeleteRows', {
                        selectedRows: selectedRows
                    });
                }
            });
            return false;
        }

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }



    </script>
</body>
</html>
