<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_form_window_celledit.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_form_window_celledit" %>

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
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" EnableCollapse="false" runat="server" AllowCellEditing="true" ClicksToEdit="2"
            DataIDField="Id" Title="表格与表单">
            <Toolbars>
                <f:Toolbar ID="Toolbar2" Position="Top" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增" Icon="Add" runat="server" ClickHandler="onNewButtonClick"></f:Button>
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
                <f:RenderField ColumnID="Edit" Width="50px">
                    <Commands>
                        <f:Command RendererFunction="renderClientAction" Icon="Pencil" />
                    </Commands>
                </f:RenderField>
                <f:RenderField ColumnID="Delete" Width="50px">
                    <Commands>
                        <f:Command RendererFunction="renderClientAction" Icon="Delete" />
                    </Commands>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="btnSaveAll" Text="全部保存" Icon="DatabaseSave" OnClick="btnSaveAll_Click" runat="server">
        </f:Button>

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
                                <f:Button ID="btnSave" Icon="TableSave" runat="server" Text="保存到表格" ValidateForms="SimpleForm1"
                                    ClickHandler="onSaveToTableClick">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                </f:SimpleForm>
            </Items>
        </f:Window>
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

        // 显示编辑/新增窗体
        function showEditWindow(rowId) {
            var grid1 = F(gridClientID);
            var window1 = F(windowClientID);

            // 如果传入参数为空，则获取当前选中行
            if (!rowId) {
                var selectedRowIds = grid1.getSelectedRows();
                if (!selectedRowIds.length) {
                    F.alert('请至少选择一项！');
                    return;
                }

                rowId = selectedRowIds[0];
            }


            window1.setTitle('编辑数据');

            // 当前行数据
            var rowValue = grid1.getRowValue(rowId);

            // 使用当前行数据填充表单字段
            F(hfFormIDClientID).setValue(rowId);
            F(tbxFormUserNameClientID).setValue(rowValue['Name']);
            F(rblFormGenderClientID).setValue(rowValue['Gender']);
            F(nbFormEntranceYearClientID).setValue(rowValue['EntranceYear']);
            F(dpFormEntranceDateClientID).setValue(rowValue['EntranceDate']);
            F(cbFormAtSchoolClientID).setValue(rowValue['AtSchool']);
            F(ddlFormMajorClientID).setValue(rowValue['Major']);

            // 弹出新增窗体
            window1.show();
        }

        // 表单数据更新至表格
        function saveToTable() {
            var grid1 = F(gridClientID);
            var window1 = F(windowClientID);

            var rowId = F(hfFormIDClientID).getValue();

            if (rowId) {
                // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                grid1.updateCellValue(rowId, {
                    'Name': F(tbxFormUserNameClientID).getValue(),
                    'Gender': F(rblFormGenderClientID).getValue(),
                    'EntranceYear': F(nbFormEntranceYearClientID).getValue(),
                    'EntranceDate': F(dpFormEntranceDateClientID).getValue(),
                    'AtSchool': F(cbFormAtSchoolClientID).getValue(),
                    'Major': F(ddlFormMajorClientID).getValue()
                });
            } else {
                grid1.addNewRecord({
                    'Name': F(tbxFormUserNameClientID).getValue(),
                    'Gender': F(rblFormGenderClientID).getValue(),
                    'EntranceYear': F(nbFormEntranceYearClientID).getValue(),
                    'EntranceDate': F(dpFormEntranceDateClientID).getValue(),
                    'AtSchool': F(cbFormAtSchoolClientID).getValue(),
                    'Major': F(ddlFormMajorClientID).getValue(),
                    'Edit': '',
                    'Delete': ''
                }, true);
            }

            window1.hide();
        }


        F.ready(function() {

            var grid1 = F(gridClientID);

            grid1.el.on('click', '.f-grid-cell-Edit a,.f-grid-cell-Delete a', function(event) {
                event.preventDefault();
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid1.getRowData(rowEl);
                var rowId = rowData.id;

                if (targetEl.parents('.f-grid-cell-Edit').length) {
                    // 点击了行编辑图标
                    showEditWindow(rowId);
                } else {
                    // 点击了行删除图标
                    F.confirm({
                        message: '删除选中行？',
                        messageIcon: 'question',
                        ok: function() {
                            grid1.deleteRow(rowId);
                        }
                    });
                }
            });

        });

        function onSaveToTableClick(event) {
            saveToTable();
        }

    </script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把窗体编辑先作为表格待提交修改，点击全部保存后才交给后台。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>区分保存到表格与提交后台</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格与表单">表格与表单</strong>某行的编辑入口，将<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxFormUserName").ClientID %>'
                        title="表单的姓名">表单的姓名</strong>改为<code>待保存的名字</code>，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSave").ClientID %>'
                        title="保存到表格">保存到表格</strong>。<br />结果：窗体关闭，浏览器把表单值写入原行并显示修改标记；这一步没有提交后台。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSaveAll").ClientID %>'
                        title="全部保存">全部保存</strong>。<br />结果：后台读取全部待提交变更并更新示例数据，重新绑定后修改标记清除；没有变化时提示表格数据没有变化。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：初始[性别]和[入学日期]列处于隐藏状态。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>updateCellValue / addNewRecord</code>（<strong>联动处理</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格与表单">表格与表单</strong>）：窗体操作按是否已有行标识选择修改或新增，本页先积累在浏览器。</li>
                <li><code>GetModifiedData</code>（<strong>后台保存处理</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格与表单">表格与表单</strong>）：全部保存时统一读取待新增、待删除及修改记录，按状态更新示例数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
