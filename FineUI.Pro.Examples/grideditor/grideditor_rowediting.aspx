<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_rowediting.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_rowediting" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

    <style>
        .f-grid-cell-EntranceYear2 .f-grid-cell-text {
            opacity: .6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false"
            runat="server" AllowCellEditing="true" ClicksToEdit="1" IsRowEditing="true">
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
                        <f:DropDownList ID="ddlGender" Required="true" runat="server">
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
                <f:RenderField Width="160px" ColumnID="EntranceYear2" DataField="EntranceYear" FieldType="Int"
                    HeaderText="入学年份（不可编辑）">
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
        说明：
        <ul>
            <li>方向键在单元格之间导航（非编辑状态）</li>
            <li>回车键使单元格进入编辑状态</li>
            <li>ESC键取消单元格的编辑状态</li>
            <li>Tab键进入下一个单元格（如果单元格可编辑，则使其进入编辑状态）</li>
            <li>Shift+Tab键回退到上一个单元格（如果单元格可编辑，则使其进入编辑状态）</li>
        </ul>
    </form>
    <script>

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


    </script>
</body>
</html>
