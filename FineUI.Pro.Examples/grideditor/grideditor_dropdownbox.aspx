<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_dropdownbox.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_dropdownbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（进入编辑状态后，从下拉表格中选择用户）" EnableCollapse="false"
            Height="350px" runat="server" AllowCellEditing="true" ClicksToEdit="1">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onNewClick">
                        </f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" runat="server" ClickHandler="onDeleteClick">
                        </f:Button>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
                        <f:Button ID="btnReset" Text="重置表格数据" runat="server" ClickHandler="onResetClick">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名（隐藏列，用来将用户名保存到数据库中）" Hidden="true">
                </f:RenderField>
                <f:RenderField ColumnID="Code" DataField="Code" HeaderText="姓名" RendererFunction="renderCode">
                    <Editor>
                        <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请选择" MatchFieldWidth="false" EnableMultiSelect="false">
                            <PopPanel>
                                <f:Grid ID="Grid2" ShowBorder="true" ShowHeader="false" runat="server" DataIDField="Id" DataTextField="Name" Hidden="true"
                                    Width="650px" Height="300px" EnableMultiSelect="false">
                                    <Columns>
                                        <f:RowNumberField />
                                        <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                                        <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                                        </f:RenderField>
                                        <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                                        <f:RenderField ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date"
                                            RendererArgument="yyyy-MM-dd" HeaderText="入学日期" />
                                        <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                                        <f:RenderField ColumnID="Major" DataField="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" />
                                    </Columns>
                                    <Listeners>
                                        <f:Listener Event="rowclick" Handler="onGrid2RowClick" />
                                    </Listeners>
                                </f:Grid>
                            </PopPanel>
                        </f:DropDownBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Code2" DataField="Code" HeaderText="编码">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                    <Editor>
                        <f:NumberBox ID="tbxEditorEntranceYear" NoDecimal="true" NoNegative="true" MinValue="2000" MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="入学日期">
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
                <f:RenderField ColumnID="Delete" Width="50px" TextAlign="Center" EnableHeaderMenu="false">
                    <Commands>
                        <f:Command CommandName="Delete" Icon="Delete" ConfirmText="删除选中行？" ConfirmTarget="Top" />
                    </Commands>
                </f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="rowcommand" Handler="onGrid1RowCommand" />
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

    </form>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        // 删除工具栏中选中的行（先确认）。
        function deleteSelectedRows() {
            F.confirm({
                message: '删除选中行？',
                messageIcon: 'question',
                ok: function() {
                    F(Grid1ClientID).deleteSelectedRows(false);
                }
            });
        }

        function onNewClick(event) {
            F(Grid1ClientID).addNewRecord({
                    "Name": "",
                    "Gender": "1",
                    "EntranceYear": "2000",
                    "EntranceDate": "2000-09-01",
                    "AtSchool": false,
                    "Major": "未知"
                },
                true);
        }

        function onGrid1RowCommand(event, rowId, rowIndex, columnId, commandName) {
            if (commandName === 'Delete') {
                F(Grid1ClientID).deleteRow(rowId);
            }
        }

        function onDeleteClick(event) {
            if (!F(Grid1ClientID).hasSelection()) {
                F.alert({
                    message: '请至少选择一项！',
                    messageIcon: 'information'
                });
                return false;
            }
            deleteSelectedRows();
        }

        function onResetClick(event) {
            F.confirm({
                message: '确定要重置表格数据？',
                ok: function() {
                    F(Grid1ClientID).rejectChanges();
                },
                messageIcon: 'question'
            });
        }


        var grid1ClientID = '<%= Grid1.ClientID %>';
        var grid2ClientID = '<%= Grid2.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function renderCode(value) {
            if (!value) {
                return '';
            }

            var grid2 = F(grid2ClientID);
            return grid2.getRowData(value).text;
        }


        function onGrid2RowClick(event, grid2RowId) {
            var grid1 = F(grid1ClientID);
            var grid1RowId = grid1.getSelectedCell()[0];
            var rowValue = this.getRowValue(grid2RowId);

            // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
            // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
            grid1.updateCellValue(grid1RowId, {
                'Code2': grid2RowId,
                'Code': grid2RowId,
                'Name': rowValue.Name,
                'Gender': rowValue.Gender,
                'EntranceYear': rowValue.EntranceYear,
                'EntranceDate': rowValue.EntranceDate,
                'AtSchool': rowValue.AtSchool,
                'Major': rowValue.Major
            });

        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>从下拉表格选择一个用户，把标识、姓名及关联资料一起回填到当前编辑行。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>选择用户并回填关联字段</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnNew").ClientID %>'
                        title="新增数据">新增数据</strong>。<br />结果：表格创建待编辑新行，接下来的选择回填作用于这条行。</li>
                <li>单击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（进入编辑状态后，从下拉表格中选择用户）">表格（进入编辑状态后，从下拉表格中选择用户）</strong>的<strong>编码</strong>单元格，打开<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>' title="第 2 个数据列（姓名）列的下拉框">第 2
                        个数据列（姓名）列的下拉框</strong>的下拉入口。<br />结果：显示供选择的用户表格，当前主表编辑行保持不变。</li>
                <li>在下拉用户表格选择首行张萍萍，再结束编辑。<br />结果：当前行回填张萍萍及其<strong>性别</strong>、年份、专业等资料；<strong>编码</strong>保留所选用户标识 101，显示文字与<strong>编码</strong>分别取值。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li><strong>姓名</strong>列的内部数据其实是用户<strong>编码</strong>，通过 RendererFunction 来转换为<strong>姓名</strong></li>
                <li><strong>编码</strong>到<strong>姓名</strong>的转换是通过查询下拉表格数据来完成的，因此如果表格存在分页，这种方式就无效了</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataControlID</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>' title="第 2 个数据列（姓名）列的下拉框">第 2
                        个数据列（姓名）列的下拉框</strong>）：使用内嵌用户表格提供选项，不把显示<strong>姓名</strong>当作稳定业务标识。</li>
                <li><code>RendererFunction / updateCellValue</code>（<strong>编码列与选择回调</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（进入编辑状态后，从下拉表格中选择用户）">表格（进入编辑状态后，从下拉表格中选择用户）</strong>）：按<strong>编码</strong>取显示<strong>姓名</strong>，选中用户后一次更新关联列。</li>
            </ul>
        </section>
    </template>
</body>
</html>
