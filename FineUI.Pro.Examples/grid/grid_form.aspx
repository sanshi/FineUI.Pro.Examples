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
                <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" EnableCollapse="false" BoxFlex="1" CssClass="maingrid" runat="server"
                    AllowCellEditing="true" ClicksToEdit="2" DataIDField="Id">
                    <Columns>
                        <f:RowNumberField Width="60px" ColumnID="Number" />
                        <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                        </f:RenderField>
                        <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别" Hidden="true">
                        </f:RenderField>
                        <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                        </f:RenderField>
                        <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date"
                            RendererArgument="yyyy-MM-dd" HeaderText="入学日期" Hidden="true">
                        </f:RenderField>
                        <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" EnableColumnEdit="false" />
                        <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
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
                                <f:Button ID="btnSave" Icon="SystemSave" runat="server" Text="保存数据（新增）" ValidateForms="SimpleForm1" OnClick="btnSave_Click">
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>选择表格行填充旁边表单，在同一表单中完成新增、编辑与删除。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>选择记录后编辑并保存</h3>
            <ol>
                <li>选择<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一行。<br />结果：表单填入所选记录的<strong>姓名</strong>、<strong>性别</strong>、年份等资料，保存行为切换到编辑该条记录。</li>
                <li>将<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxFormUserName").ClientID %>'
                        title="第 1 个文本框（姓名）">表单的姓名</strong>改为<code>改过的名字</code>，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSave").ClientID %>'
                        title="保存数据（新增）">保存数据（新增）</strong>。<br />结果：表单验证通过后回发，后台按记录标识更新示例数据并重新绑定，原行显示新<strong>姓名</strong>。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>用同一表单新增记录</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnNew").ClientID %>'
                        title="新增（加号图标）">新增（加号图标）</strong>，填写<strong>姓名</strong>等必填资料并保存。<br />结果：清空原记录标识，表单进入新增状态；验证通过后后台创建新记录并绑定到表格，不覆盖刚才的原记录。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>确认删除所选记录</h3>
            <ul>
                <li>选择一条已有记录，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDelete").ClientID %>'
                        title="删除（删除图标）">删除（删除图标）</strong>并确认。<br />结果：后台删除对应示例记录并重新绑定；未选择已有记录时不会以新增表单的空标识删除数据。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowselect / setValue</code>（<strong>表格选择与表单回填脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：选择当前行后把行数据填入表单，同时记录本次编辑的业务主键。
                </li>
                <li><code>ValidateForms</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSave").ClientID %>' title="保存数据（新增）">保存数据（新增）</strong>）：初始为
                    <code>SimpleForm1</code>，提交前检查本页编辑表单，失败时保留用户输入并阻止保存。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
