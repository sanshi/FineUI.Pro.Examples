<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_vertical_enter_tosave.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_vertical_enter_tosave" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false"
            runat="server"
            AllowCellEditing="true" ClicksToEdit="1"
            TabVerticalNavigate="true" EnterSameAsTab="true">
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
            <Listeners>
                <f:Listener Event="beforetabedit" Handler="onGridBeforeTabEdit" />
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
        快捷键说明：
        <ul>
            <li>方向键在单元格之间导航（非编辑状态）</li>
            <li>ESC 键取消单元格的编辑状态</li>
            <li>Enter、Tab 键进入垂直方向的下一个单元格（如果单元格可编辑，则使其进入编辑状态）</li>
            <li>Shift+Enter、Shift+Tab 键回退到垂直方向的上一个单元格（如果单元格可编辑，则使其进入编辑状态）</li>
            <li>在最后一个单元格按下 Enter 或者 ESC 键，会触发[保存数据]按钮的点击事件</li>
        </ul>
    </form>
    <script>

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


        var saveBtnClientID = '<%= Button2.ClientID %>';

        function onGridBeforeTabEdit(event, params) {
            // 如果当前列是[所学专业]列，并且 TAB键 要跳转到的单元格为空（也就是当前位于表格的最后一个单元格）
            if (params.columnId === 'Major' && !params.nextTd.length) {
                // 点击保存按钮
                F(saveBtnClientID).click();

                // 阻止 TAB键 跳转
                return false;
            }
        }

    </script>
</body>
</html>
