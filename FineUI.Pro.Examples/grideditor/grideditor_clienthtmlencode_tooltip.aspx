<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_clienthtmlencode_tooltip.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_clienthtmlencode_tooltip" ValidateRequest="false" %>

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
            AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField />
                <f:RenderField Width="150px" ColumnID="Name" DataField="Name"
                    HeaderText="姓名（提示信息）" RendererFunction="renderName">
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
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业（提示信息）" RendererFunction="renderMajor">
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
        <br />
        注：
        <ul>
            <li>页面声明：ValidateRequest="false"（因为回发的数据中可能存在HTML标签）</li>
            <li>初始数据中，最后一行的[所学专业]包含HTML标签</li>
            <li>[姓名]和[所学专业]列中单元格有提示信息，修改单元格值后提示信息随之改变</li>
        </ul>
    </form>
    <script>

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function renderName(value, params) {
            params.cellAttrs = {
                'data-qtip': F.htmlEncode(value)
            };
            // 列渲染函数可以直接返回包含HTML标签的字符串，系统不会对返回值进行编码处理，所以需要自行对列渲染函数的返回值进行必要的HTML编码
            return F.htmlEncode(value);
        }

        function renderMajor(value, params) {
            params.cellAttrs = {
                'data-qtip': F.htmlEncode(value)
            };
            // 列渲染函数可以直接返回包含HTML标签的字符串，系统不会对返回值进行编码处理，所以需要自行对列渲染函数的返回值进行必要的HTML编码
            return F.htmlEncode(value);
        }

    </script>
</body>
</html>
