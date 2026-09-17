<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_form.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .maingrid {
            border-width: 0 1px 0 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" IsFluid="true" runat="server" Title="表格与表单" Layout="HBox" Height="500px">
            <Items>
                <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" EnableCollapse="false" BoxFlex="1" CssClass="maingrid"
                    runat="server" AllowCellEditing="true" ClicksToEdit="2"
                    DataIDField="Id">
                    <Columns>
                        <f:TemplateField Width="60px">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                        </f:TemplateField>
                        <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                        </f:RenderField>
                        <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int"
                            RendererFunction="renderGender" HeaderText="性别" Hidden="true">
                        </f:RenderField>
                        <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int"
                            HeaderText="入学年份">
                        </f:RenderField>
                        <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date"
                            Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="入学日期" Hidden="true">
                        </f:RenderField>
                        <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" EnableColumnEdit="false" />
                        <f:RenderField ColumnID="Major" DataField="Major"
                            ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                        </f:RenderField>
                    </Columns>
                    <Listeners>
                        <f:Listener Event="rowselect" Handler="onGridRowSelect" />
                    </Listeners>
                </f:Grid>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" ShowHeader="false" BodyPadding="10px" Width="300px">
                    <Items>
                        <f:HiddenField ID="hfFormID" runat="server"></f:HiddenField>
                        <f:TextBox ID="tbxFormUserName" Label="姓名" ShowRedStar="true" Required="true" runat="server">
                        </f:TextBox>
                        <f:RadioButtonList ID="rblFormGender" Label="性别" ShowRedStar="true" Required="true" runat="server">
                            <f:RadioItem Text="男" Value="1" />
                            <f:RadioItem Text="女" Value="0" />
                        </f:RadioButtonList>
                        <f:NumberBox ID="nbFormEntranceYear" Label="入学年份" NoDecimal="true" NoNegative="true" MinValue="2000" ShowRedStar="true" Required="true"
                            MaxValue="2025" runat="server">
                        </f:NumberBox>
                        <f:DatePicker ID="dpFormEntranceDate" Label="入学日期" ShowRedStar="true" Required="true" runat="server">
                        </f:DatePicker>
                        <f:CheckBox ID="cbFormAtSchool" Label="是否在校" runat="server">
                        </f:CheckBox>
                        <f:DropDownList ID="ddlFormMajor" Label="所学专业" ShowRedStar="true" Required="true" AutoSelectFirstItem="false" runat="server">
                            <f:ListItem Text="材料科学与工程系" Value="材料科学与工程系" />
                            <f:ListItem Text="化学系" Value="化学系" />
                            <f:ListItem Text="数学系" Value="数学系" />
                            <f:ListItem Text="物理系" Value="物理系" />
                            <f:ListItem Text="自动化系" Value="自动化系" />
                            <f:ListItem Text="计算机科学与工程系" Value="计算机科学与工程系" />
                        </f:DropDownList>
                    </Items>
                    <Toolbars>
                        <f:Toolbar ID="Toolbar1" Position="Bottom" runat="server">
                            <Items>
                                <f:Button ID="btnNew" Text="" Icon="Add" runat="server" ClickHandler="onNewButtonClick"></f:Button>
                                <f:Button ID="btnDelete" Text="" Enabled="false" Icon="Delete" ConfirmText="确定删除当前数据？" OnClick="btnDelete_Click" runat="server">
                                </f:Button>
                                <f:ToolbarFill ID="ToolbarFill1" runat="server"></f:ToolbarFill>
                                <f:Button ID="btnSave"
                                    Icon="SystemSave" runat="server" Text="保存数据（新增）" ValidateForms="SimpleForm1" OnClick="btnSave_Click">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                </f:SimpleForm>
            </Items>
        </f:Panel>
        <br />
        <br />
        <br />
    </form>
    <script>

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


        var gridClientID = '<%= Grid1.ClientID %>';
        var btnDeleteClientID = '<%= btnDelete.ClientID %>';
        var btnSaveClientID = '<%= btnSave.ClientID %>';

        var formClientID = '<%= SimpleForm1.ClientID %>';
        var hfFormIDClientID = '<%= hfFormID.ClientID %>';
        var tbxFormUserNameClientID = '<%= tbxFormUserName.ClientID %>';
        var rblFormGenderClientID = '<%= rblFormGender.ClientID %>';
        var nbFormEntranceYearClientID = '<%= nbFormEntranceYear.ClientID %>';
        var dpFormEntranceDateClientID = '<%= dpFormEntranceDate.ClientID %>';
        var cbFormAtSchoolClientID = '<%= cbFormAtSchool.ClientID %>';
        var ddlFormMajorClientID = '<%= ddlFormMajor.ClientID %>';


        function onGridRowSelect(event, rowId) {
            var grid = F(gridClientID);

            // 启用删除按钮
            F(btnDeleteClientID).enable();

            // 当前行数据
            var rowValue = grid.getRowValue(rowId);

            // 使用当前行数据填充表单字段
            F(hfFormIDClientID).setValue(rowId);
            F(tbxFormUserNameClientID).setValue(rowValue['Name']);
            F(rblFormGenderClientID).setValue(rowValue['Gender']);
            F(nbFormEntranceYearClientID).setValue(rowValue['EntranceYear']);
            F(dpFormEntranceDateClientID).setValue(rowValue['EntranceDate']);
            F(cbFormAtSchoolClientID).setValue(rowValue['AtSchool']);
            F(ddlFormMajorClientID).setValue(rowValue['Major']);

            // 更新保存按钮文本
            F(btnSaveClientID).setText('保存数据（编辑）');
        }


        function onNewButtonClick(event) {
            // 重置表单字段
            F(formClientID).reset();
            // 清空表格选中行
            F(gridClientID).clearSelection();
            // 禁用删除按钮
            F(btnDeleteClientID).disable();

            // 更新保存按钮文本
            F(btnSaveClientID).setText('保存数据（新增）');
        }

    </script>
</body>
</html>
