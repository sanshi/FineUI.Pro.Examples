<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_setcolumnvalue.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_setcolumnvalue" %>

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
        </f:Grid>
        <br />
        <f:Button ID="btnUpdateGender" runat="server" Text="[性别]全部更新为男" ClickHandler="onUpdateGenderClick"></f:Button>
        <f:Button ID="btnUpdateEntranceYear" runat="server" Text="[入学年份]全部更新为2008" ClickHandler="onUpdateEntranceYearClick"></f:Button>
        <f:Button ID="btnUpdateAtSchoolTrue" runat="server" Text="[是否在校]全部更新为TRUE" ClickHandler="onUpdateAtSchoolTrueClick"></f:Button>
        <f:Button ID="btnUpdateAtSchoolFalse" runat="server" Text="[是否在校]全部更新为FALSE" ClickHandler="onUpdateAtSchoolFalseClick"></f:Button>
        <br />
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
        var gridClientID = '<%= Grid1.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function resolveRows(columnId, newValue) {
            var grid = F(gridClientID);
            grid.getRowEls().each(function () {
                grid.updateCellValue(this, columnId, newValue);
            });
        }

        function onUpdateGenderClick(event) {
            resolveRows('Gender', 1);
        }

        function onUpdateEntranceYearClick(event) {
            resolveRows('EntranceYear', 2008);
        }

        function onUpdateAtSchoolTrueClick(event) {
            resolveRows('AtSchool', true);
        }

        function onUpdateAtSchoolFalseClick(event) {
            resolveRows('AtSchool', false);
        }

    </script>
</body>
</html>
