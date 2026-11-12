<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_textarea.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_textarea" %>

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
                <f:RenderField ColumnID="Desc" DataField="Desc" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="个人简介">
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

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用多行文本框编辑个人简介，结束编辑和保存后保留输入内容。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>编辑多行个人简介</h3>
            <ol>
                <li>单击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>个人简介</strong>，在多行文本框中输入两行文字<code>第一行
                        第二行</code>，再离开单元格。<br />结果：当前单元格使用新的<strong>个人简介</strong>；文本框允许多行输入，保存时按文本值提交。</li>
                <li>再次进入同一单元格编辑。<br />结果：多行文本框重新显示刚才的输入内容，可继续编辑。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Editor</code>（<strong>个人简介列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：<strong>个人简介</strong>列使用 TextArea；读取的是文本值，保留用户输入的换行。</li>
            </ul>
        </section>
    </template>
</body>
</html>
