<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_editable_cell_afteredit.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_editable_cell_afteredit" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="1" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
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
            <Tools>
                <f:Tool runat="server" IconFont="_Refresh" ToolTip="Refresh" ClickHandler="onRefreshClick"></f:Tool>
            </Tools>
        </f:Grid>
        <br />
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

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function onGridAfterEdit(event, value, params) {
            var grid1 = this,
                rowId = params.rowId,
                columnId = params.columnId;

            if (columnId === 'AtSchool') {
                if (!value) {
                    // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
                    // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
                    grid1.updateCellValue(rowId, {
                        'Major.cls': 'f-grid-cell-uneditable'
                    });
                } else {
                    grid1.updateCellValue(rowId, {
                        'Major.cls': ''
                    });
                }
            }
        }

        function onRefreshClick(event) {
            F(Grid1ClientID).loadData();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用是否在校的当前值控制同一行所学专业能否编辑，切换后立即更新限制。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>根据在校状态切换编辑权限</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>找到未勾选<strong><strong>是否在校</strong></strong>的记录，尝试编辑<strong>所学专业</strong>。<br />结果：该专业单元格处于不可编辑状态，点击不会打开编辑器。
                </li>
                <li>勾选该行<strong>是否在校</strong>，再点击<strong><strong>所学专业</strong></strong>；随后取消在校勾选并重试。<br />结果：勾选后专业可编辑，取消后重新禁止；变更作用于当前行，不影响其他行。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>f-grid-cell-uneditable</code>（<strong>所学专业单元格</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：渲染时按 AtSchool
                    添加不可编辑样式；之后通过 updateCellValue 的 Major.cls 更新样式与编辑限制。</li>
            </ul>
        </section>
    </template>
</body>
</html>
