<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_editable.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_editable" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-cell-text {
            opacity: .5;
            filter: alpha(opacity=50);
        }

        .f-grid-cell-editable .f-grid-cell-text {
            opacity: 1;
            filter: alpha(opacity=100);
        }

        .f-grid-rownumberfield .f-grid-cell-text {
            opacity: 1;
            filter: alpha(opacity=100);
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="1">
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
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" EnableColumnEdit="false">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="btnChangeEntranceDateEditable" CssClass="marginr" runat="server" Text="切换[入学日期]列的可编辑状态" OnClick="btnChangeEntranceDateEditable_Click">
        </f:Button>
        <f:Button ID="btnChangeAtSchoolEditable" CssClass="marginr" runat="server" Text="切换[是否在校]列的可编辑状态" OnClick="btnChangeAtSchoolEditable_Click">
        </f:Button>
        <f:Button ID="btnChangeMajorEditable" runat="server" Text="切换[所学专业]列的可编辑状态" OnClick="btnChangeMajorEditable_Click">
        </f:Button>
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
        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在浏览器中切换指定列的可编辑状态，保留其他列的编辑能力。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>切换入学日期列</h3>
            <ul>
                <li>先尝试编辑<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>入学日期</strong>，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnChangeEntranceDateEditable").ClientID %>'
                        title="切换[入学日期]列的可编辑状态">切换[入学日期]列的可编辑状态</strong>后再次尝试。<br />结果：脚本立即切换列状态，该列在可编辑与禁止编辑之间切换；再点一次恢复先前状态。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>切换是否在校列</h3>
            <ul>
                <li>先尝试编辑<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>是否在校</strong>，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnChangeAtSchoolEditable").ClientID %>'
                        title="切换[是否在校]列的可编辑状态">切换[是否在校]列的可编辑状态</strong>后再次尝试。<br />结果：脚本立即切换列状态，该列在可编辑与禁止编辑之间切换；再点一次恢复先前状态。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>切换所学专业列</h3>
            <ul>
                <li>先尝试编辑<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>所学专业</strong>，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnChangeMajorEditable").ClientID %>'
                        title="切换[所学专业]列的可编辑状态">切换[所学专业]列的可编辑状态</strong>后再次尝试。<br />结果：脚本立即切换列状态，该列在可编辑与禁止编辑之间切换；再点一次恢复先前状态。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableColumnEdit</code>（<strong>所学专业</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>false</code>，控制该列是否接受编辑；本页按钮切换这个状态。
                </li>
                <li><code>toggleEditable</code>（<strong>页面脚本中的目标列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：从表格取得指定列后切换编辑状态，不需要重新绑定所有记录。</li>
            </ul>
        </section>
    </template>
</body>
</html>
