<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_dropdownbox_grid_multi_paging_serverhobby.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_dropdownbox_grid_multi_paging_serverhobby" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="1">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList ID="ddlGender" Required="true" runat="server">
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
                <f:RenderField ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="入学日期">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Hobby" DataField="Hobby" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="兴趣爱好" RendererFunction="renderHobby"
                    EditGetterFunction="editGetterHobby" EditSetterFunction="editSetterHobby">
                    <Editor>
                        <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请选择" EnableMultiSelect="true" AutoShowClearIcon="true">
                            <PopPanel>
                                <f:Grid ID="Grid2" ShowBorder="true" ShowHeader="false" runat="server" EnableCheckBoxSelect="true" KeepCurrentSelection="true"
                                    Hidden="true" DataIDField="Code" DataTextField="Name" EnableMultiSelect="true" AllowPaging="true" PageSize="3"
                                    ShowPagingMessage="false" PagingType="NumberButton">
                                    <Columns>
                                        <f:RowNumberField></f:RowNumberField>
                                        <f:RenderField ColumnID="Code" DataField="Code" HeaderText="代码" />
                                        <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="姓名" />
                                    </Columns>
                                </f:Grid>
                            </PopPanel>
                        </f:DropDownBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="HobbyText" DataField="HobbyText" Hidden="true"></f:RenderField>
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

    </form>
    <script>
        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


        function renderHobby(value, params) {
            return params.rowValue['HobbyText'];
        }

        // 自定义编辑器获取函数（从Editor返回单元格）
        function editGetterHobby(editor, columnId, rowId) {
            // 将Editor的值返回到表格单元格，随后的renderHobby会用到
            // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
            // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
            this.updateCellValue(rowId, {
                HobbyText: editor.getText()
            });
            return editor.getValue().join(',');
        }

        // 自定义编辑器设置函数（从单元格进入Editor）
        function editSetterHobby(editor, val, columnId, rowId) {
            editor.setValue(val, this.getRowData(rowId).values['HobbyText']);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把兴趣代码与显示名称分别保存，分页下拉表格中不在当前页的已选项仍可正确回显。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>跨下拉表格分页选择并回显</h3>
            <ol>
                <li>打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>兴趣爱好</strong>编辑器，在弹出的表格中选中两项，可在不同分页分别选择，再结束编辑。<br />结果：单元格显示所选兴趣名称，实际值保留对应<strong>代码</strong>集合；本页同时更新隐藏的显示名称字段，回显不依赖当前分页是否包含这些记录。
                </li>
                <li>再次进入同一<strong>兴趣爱好</strong>单元格。<br />结果：自定义设置函数把原来的值及对应名称交给编辑器，即使部分选项不在当前页，显示与已选状态仍能正确恢复。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableMultiSelect</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>' title="兴趣爱好列的下拉框">兴趣爱好列的下拉框</strong>）：初始为
                    <code>true</code>，允许下拉编辑器保留多项值。
                </li>
                <li><code>EditSetterFunction</code>（<strong>下拉编辑器所在列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：进入编辑时同时提供选项值和显示文字，不能只依靠当前页数据查名称。</li>
                <li><code>EditGetterFunction</code>（<strong>下拉编辑器所在列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：结束编辑时写回兴趣<strong>代码</strong>，并更新 HobbyText 供单元格渲染；两个字段在同一次操作中保持一致。</li>
            </ul>
        </section>
    </template>
</body>
</html>
