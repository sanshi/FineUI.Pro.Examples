<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_form_window.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_form_window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" EnableCollapse="false" runat="server" DataKeyNames="Id,Name"
            AllowCellEditing="true" ClicksToEdit="2" DataIDField="Id" Title="表格与表单" OnRowCommand="Grid1_RowCommand">
            <Toolbars>
                <f:Toolbar ID="Toolbar2" Position="Top" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增" Icon="Add" runat="server" ClickHandler="onNewButtonClick"></f:Button>
                        <f:Button ID="btnEdit" Text="编辑" Icon="Pencil" runat="server" ClickHandler="onEditButtonClick"></f:Button>
                        <f:Button ID="btnDelete" Text="删除" Icon="Delete" runat="server" ClickHandler="onDeleteButtonClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField Width="60px" ColumnID="Number" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别" Hidden="true">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="入学日期" Hidden="true">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" EnableColumnEdit="false" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Edit" Width="50px" TextAlign="Center" EnableHeaderMenu="false">
                    <Commands>
                        <f:Command CommandName="Edit" Icon="Pencil" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Delete" Width="50px">
                    <Commands>
                        <f:Command ConfirmText="删除选中行？" ConfirmTarget="Top" CommandName="Delete" Icon="Delete" />
                    </Commands>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
            </Listeners>
        </f:Grid>

        <f:Window ID="Window1" Title="弹出窗体" Hidden="true" EnableIFrame="false" EnableMaximize="true" Target="Self" EnableResize="true" runat="server"
            IsModal="true" Width="600px">
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" ShowHeader="false" BodyPadding="10px">
                    <Items>
                        <f:HiddenField ID="hfFormID" runat="server"></f:HiddenField>
                        <f:TextBox ID="tbxFormUserName" ShowRedStar="true" Label="姓名" Required="true" runat="server">
                        </f:TextBox>
                        <f:RadioButtonList ID="rblFormGender" Label="性别" ShowRedStar="true" Required="true" runat="server">
                            <f:RadioItem Text="男" Value="1" />
                            <f:RadioItem Text="女" Value="0" />
                        </f:RadioButtonList>
                        <f:NumberBox ID="nbFormEntranceYear" Label="入学年份" NoDecimal="true" NoNegative="true" MinValue="2000" ShowRedStar="true" Required="true"
                            MaxValue="2025" runat="server">
                        </f:NumberBox>
                        <f:DatePicker ID="dpFormEntranceDate" Label="入学日期" ShowRedStar="true" Required="true" runat="server" EnableEdit="false">
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
                        <f:Toolbar ID="Toolbar1" Position="Bottom" ToolbarAlign="Right" runat="server">
                            <Items>
                                <f:Button ID="btnSave" Icon="SystemSave" runat="server" Text="保存数据" ValidateForms="SimpleForm1" OnClick="btnSave_Click">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                </f:SimpleForm>
            </Items>
        </f:Window>
        <br />
        <br />
        <br />
    </form>
    <script>
        // 选中行数只有浏览器知道，所以在这里拼；<b> 是我们自己写的可信 HTML，用 F.rawHtml 原样输出。
        // 客户端已经拿着选中行的标识，用自定义回发直接送到服务端，不必让服务端再从回发状态里反推。
        // （确认框是异步的，没法在这个函数里等用户点完，所以先 return false，点确定后由 ok 回调发起回发。
        //   自定义回发不带表单验证、回发前禁用按钮这些按钮内置回发才有的特性，需要的话在这里自己写。）
        function onDeleteButtonClick(event) {
            var grid = F(gridClientID);
            if (!grid.hasSelection()) {
                F.alert('请至少选择一项！');
                return false;
            }

            var selectedRows = grid.getSelectedRows();
            F.confirm({
                message: F.rawHtml('你确定要删除选中的&nbsp;<b>' + selectedRows.length + '</b>&nbsp;行数据吗？'),
                messageIcon: 'warning',
                ok: function() {
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


        var windowClientID = '<%= Window1.ClientID %>';
        var gridClientID = '<%= Grid1.ClientID %>';
        var btnSaveClientID = '<%= btnSave.ClientID %>';

        var formClientID = '<%= SimpleForm1.ClientID %>';
        var hfFormIDClientID = '<%= hfFormID.ClientID %>';
        var tbxFormUserNameClientID = '<%= tbxFormUserName.ClientID %>';
        var rblFormGenderClientID = '<%= rblFormGender.ClientID %>';
        var nbFormEntranceYearClientID = '<%= nbFormEntranceYear.ClientID %>';
        var dpFormEntranceDateClientID = '<%= dpFormEntranceDate.ClientID %>';
        var cbFormAtSchoolClientID = '<%= cbFormAtSchool.ClientID %>';
        var ddlFormMajorClientID = '<%= ddlFormMajor.ClientID %>';


        function onNewButtonClick(event) {
            // 重置表单字段
            F(formClientID).reset();

            // 弹出窗体
            F(windowClientID).show();
            F(windowClientID).setTitle('新增数据');
        }

        function onEditButtonClick(event) {
            showEditWindow();
        }

        function onGrid1RowCommand(event, rowId, rowIndex, columnId, commandName) {
            if (commandName === 'Edit') {
                showEditWindow(rowId);
                return false;
            }
        }

        function showEditWindow(rowId) {
            var grid = F(gridClientID);

            // 如果传入参数为空，则获取当前选中行
            if (!rowId) {
                var selectedRowIds = grid.getSelectedRows();
                if (!selectedRowIds.length) {
                    F.alert('请至少选择一项！');
                    return;
                }

                rowId = selectedRowIds[0];
            }


            F(windowClientID).setTitle('编辑数据');

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

            // 弹出新增窗体
            F(windowClientID).show();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在独立窗体中新增或编辑学生，表单保存后立即更新后台示例数据与表格。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>选择记录后编辑并保存</h3>
            <ol>
                <li>选择<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格与表单">表格与表单</strong>一行，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnEdit").ClientID %>'
                        title="编辑">编辑</strong>。<br />结果：表单填入所选记录的<strong>姓名</strong>、<strong>性别</strong>、年份等资料，保存行为切换到编辑该条记录。</li>
                <li>将<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxFormUserName").ClientID %>'
                        title="表单的姓名">表单的姓名</strong>改为<code>改过的名字</code>，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSave").ClientID %>'
                        title="保存数据">保存数据</strong>。<br />结果：表单验证通过后回发，后台按记录标识更新示例数据并重新绑定，原行显示新<strong>姓名</strong>。编辑窗体关闭。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>用同一表单新增记录</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnNew").ClientID %>'
                        title="新增">新增</strong>，填写<strong>姓名</strong>等必填资料并保存。<br />结果：清空原记录标识，表单进入新增状态；验证通过后后台创建新记录并绑定到表格，不覆盖刚才的原记录。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>确认删除所选记录</h3>
            <ul>
                <li>选择一条已有记录，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnDelete").ClientID %>'
                        title="删除">删除</strong>并确认。<br />结果：后台删除对应示例记录并重新绑定；未选择已有记录时不会以新增表单的空标识删除数据。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowselect / setValue</code>（<strong>表格选择与表单回填脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格与表单">表格与表单</strong>）：选择当前行后把行数据填入表单，同时记录本次编辑的业务主键。</li>
                <li><code>ValidateForms</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSave").ClientID %>' title="保存数据">保存数据</strong>）：初始为
                    <code>SimpleForm1</code>，提交前检查本页编辑表单，失败时保留用户输入并阻止保存。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
