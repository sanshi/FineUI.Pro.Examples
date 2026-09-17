<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_radio.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_radio" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false"
            runat="server" AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField Width="150px" ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderCheckField Width="150px" ColumnID="TestColumn1" HeaderText="测试列（单选）" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="afteredit" Handler="onGrid1AfterEdit"></f:Listener>
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
    <script>

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function onGrid1AfterEdit(event, value, params) {
            var grid1 = F('<%= Grid1.ClientID %>');

            // 如果取消复选框选中，则不做处理
            if (value && params.columnId === 'TestColumn1') {
                // 遍历所有的行
                grid1.getRowEls().each(function () {
                    var row = grid1.getRowData($(this));
                    if (row.id !== params.rowId) {
                        // 如果不是当前操作的行，则取消单元格选中
                        grid1.updateCellValue(row.id, params.columnId, false);
                    }
                });

            }
        }


    </script>
</body>
</html>
