<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_textarea_editgetter.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_textarea_editgetter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-row .f-grid-cell-text {
            white-space: normal;
            word-break: break-all;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" Height="500px"
            runat="server" AllowCellEditing="true" ClicksToEdit="1">
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
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份" Hidden="true">
                    <Editor>
                        <f:NumberBox ID="tbxEditorEntranceYear" NoDecimal="true" NoNegative="true" MinValue="2000" MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="入学日期" Hidden="true">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" Hidden="true" />
                <f:RenderField Width="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Desc" DataField="Desc" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="个人简介" EditGetterFunction="editGetterDesc"
                    EditSetterFunction="editSetterDesc">
                    <Editor>
                        <f:TextArea ID="TextArea1" Required="true" runat="server">
                        </f:TextArea>
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
        <br />
    </form>
    <script>
        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        // 自定义编辑器获取函数（从Editor返回单元格）
        function editGetterDesc(editor) {
            return editor.getText().replace(/\n/g, '<br/>');
        }

        // 自定义编辑器设置函数（从单元格进入Editor）
        function editSetterDesc(editor, val, columnId, rowId) {
            editor.setText(val.replace(/<br\/>/g, '<br>').replace(/<br>/g, '\n'));
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在多行编辑器的换行符与单元格 HTML 换行之间转换，重新编辑时保留真实的多行文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照编辑文字与显示换行</h3>
            <ol>
                <li>单击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>个人简介</strong>，在多行文本框中输入两行文字<code>第一行
                        第二行</code>，再离开单元格。<br />结果：编辑器中的换行被转换为单元格显示用的换行，两个段落分别显示。</li>
                <li>再次进入同一单元格编辑。<br />结果：编辑器中仍是两行文字，不出现字面的 <code>&lt;br /&gt;</code> 标签；读取和写入方向使用配套转换。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：进入[个人简介]的编辑框时，用换行符替换 &lt;br /&gt; 标签。</p>
            <p>注：进入[个人简介]的编辑框时，用换行符替换 &lt;br /&gt; 标签。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EditGetterFunction</code>（<strong>个人简介</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>editGetterDesc</code>，从编辑器取值时，把换行符转换为显示用的 HTML 换行。
                </li>
                <li><code>EditSetterFunction</code>（<strong>个人简介</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>editSetterDesc</code>，进入编辑器时，把显示用的 HTML 换行还原为文本域换行符。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
