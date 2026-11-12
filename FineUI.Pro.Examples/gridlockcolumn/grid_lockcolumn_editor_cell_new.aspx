<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn_editor_cell_new.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridlockcolumn.grid_lockcolumn_editor_cell_new" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" Width="1000px" EnableCollapse="false" runat="server"
            AllowColumnLocking="true" AllowCellEditing="true" ClicksToEdit="2">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" runat="server" ClickHandler="onNewClick">
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
                <f:RenderField EnableLock="true" Locked="true" ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField EnableLock="true" ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField EnableLock="true" ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                    <Editor>
                        <f:NumberBox ID="tbxEditorEntranceYear" NoDecimal="true" NoNegative="true" MinValue="2000" MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" EnableLock="true" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd" HeaderText="入学日期">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField EnableLock="true" ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField Width="800px" ColumnID="Major" DataField="Major" HeaderText="所学专业">
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
    </form>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        function onNewClick(event) {
            F(Grid1ClientID).addNewRecord({
                    "Name": "新用户",
                    "Gender": "1",
                    "EntranceYear": "2015",
                    "EntranceDate": "2015-09-01",
                    "AtSchool": false,
                    "Major": "化学系"
                },
                true);
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


        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在锁定区域编辑与新增记录，编辑器定位到实际锁定单元格。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>编辑锁定单元格与新行</h3>
            <ol>
                <li>双击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>左侧锁定的<strong>姓名</strong>单元格，输入<code>锁定列测试</code>并结束编辑。<br />结果：编辑器在当前锁定格打开，结束后原行显示新<strong>姓名</strong>；普通区域仍与该行对齐。
                </li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnNew").ClientID %>'
                        title="新增数据">新增数据</strong>，填写新行后点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="保存数据">保存数据</strong>。<br />结果：后台按增改状态更新示例数据并重新绑定，锁定列和可编辑列继续保留。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowCellEditing</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，在已启用锁定的表格上接受单元格编辑。
                </li>
                <li><code>Locked</code>（<strong>姓名列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：列进入锁定区域后仍可使用为其配置的编辑器。</li>
            </ul>
        </section>
    </template>
</body>
</html>
