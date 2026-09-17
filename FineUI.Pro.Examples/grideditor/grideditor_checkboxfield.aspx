<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_checkboxfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_checkboxfield" %>

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
                <f:RenderCheckField Width="150px" ColumnID="AtSchool" DataField="AtSchool" HeaderText="RenderCheckField" />
                <f:CheckBoxField ColumnID="CheckBoxField1" Width="150px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="CheckBoxField1" />
                <f:CheckBoxField ColumnID="CheckBoxField2" Width="150px" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="CheckBoxField2" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="获取复选框列的状态（CheckBoxField2）" OnClick="Button1_Click">
        </f:Button>
        <br />
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


    </script>
</body>
</html>
