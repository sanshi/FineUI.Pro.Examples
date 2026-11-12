<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_renderfunction_complex.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_renderfunction_complex" %>

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
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" RendererFunction="renderName">
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
            </Columns>
            <Listeners>
                <f:Listener Event="afteredit" Handler="onGridAfterEdit" />
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
        var gridClientID = '<%= Grid1.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function renderName(value, params) {
            if (params.rowValue["EntranceYear"] >= 2003) {
                params.cellCls = 'highlight';
            }

            return value;
        }

        function onGridAfterEdit(event, value, params) {
            var grid = this,
                rowId = params.rowId,
                columnId = params.columnId;

            if (columnId === 'EntranceYear') {
                if (value >= 2003) {
                    // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                    // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                    grid.updateCellValue(rowId, {
                        'Name.cls': 'highlight'
                    });
                } else {
                    grid.updateCellValue(rowId, {
                        'Name.cls': ''
                    });
                }
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>姓名的高亮依赖同一行的入学年份，年份编辑完成后立即更新姓名单元格样式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>修改另一列并更新姓名样式</h3>
            <ul>
                <li>把<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>某行的<strong>入学年份</strong>改为<code>2002</code>，再改为<code>2003</code>。<br />结果：小于 2003
                    时<strong>姓名</strong>不高亮，大于等于 2003 时增加本页的高亮样式；<strong>姓名</strong>文字本身不因样式判断而改值。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：这个示例高亮所有[入学年份]大于等于 2003 的姓名，并在入学年份改变时更新姓名的高亮显示。</p>
            <ul>
                <li>如何在 RendererFunction 中获取其他列的值
                </li>
                <li>如何注册表格的 afteredit 事件，并通过 ColumnID 相关的 CSS 类来获取列
                </li>
            </ul>
            <p>注：这个示例高亮所有[入学年份]大于等于 2003 的姓名，并在入学年份改变时更新姓名的高亮显示。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RendererFunction</code>（<strong>姓名</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>renderName</code>，初次渲染时读取同一行 EntranceYear 决定<strong>姓名</strong>样式。
                </li>
                <li><code>afteredit</code>（<strong>页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：<strong>入学年份</strong>编辑完成后重设<strong>姓名</strong>单元格的样式，不只等待下一次整表绑定。</li>
                <li><code>updateCellValue</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：用 Name.cls
                    指定要更新的<strong>姓名</strong>单元格样式，数值变化与样式更新在同一行对应。</li>
            </ul>
        </section>
    </template>
</body>
</html>
