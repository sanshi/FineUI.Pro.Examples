<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_editable_column.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_editable_column" %>

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
                <f:RowNumberField></f:RowNumberField>
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
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" EnableColumnEdit="false">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="btnChangeEntranceDateEditable" CssClass="marginr" runat="server" Text="切换[入学日期]列的可编辑状态" OnClick="btnChangeEntranceDateEditable_Click">
        </f:Button>
        <f:Button ID="btnChangeAtSchoolEditable" CssClass="marginr" runat="server" Text="切换[是否在校]列的可编辑状态" OnClick="btnChangeAtSchoolEditable_Click">
        </f:Button>
        <f:Button ID="btnChangeMajorEditable" runat="server" Text="切换[所学专业]列的可编辑状态" OnClick="btnChangeMajorEditable_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：初始[所学专业]列不可编辑，可以通过上述按钮切换列的编辑状态。
    </form>
    <script>

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


        function onGridDataLoad(event) {
            var grid = this;

            grid.bodyEl.find('.f-grid-cell-EntranceDate, .f-grid-cell-AtSchool, .f-grid-cell-Major').each(function () {
                var cellEl = $(this);

                if (!cellEl.hasClass('f-grid-cell-editable')) {
                    cellEl.addClass('f-grid-cell-uneditable');
                }
            });
        }

    </script>
</body>
</html>
