<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_vertical_enter_tosave.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_vertical_enter_tosave" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="1" TabVerticalNavigate="true" EnterSameAsTab="true">
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
                <f:Listener Event="beforetabedit" Handler="onGridBeforeTabEdit" />
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
        快捷键说明：

    </form>
    <script>
        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


        var saveBtnClientID = '<%= Button2.ClientID %>';

        function onGridBeforeTabEdit(event, params) {
            // 如果当前列是[所学专业]列，并且 TAB键 要跳转到的单元格为空（也就是当前位于表格的最后一个单元格）
            if (params.columnId === 'Major' && !params.nextTd.length) {
                // 点击保存按钮
                F(saveBtnClientID).click();

                // 阻止 TAB键 跳转
                return false;
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过 Enter 与 Tab 纵向编辑导航，最后一格没有后续目标时自动点击保存。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>到达最后一格后自动保存</h3>
            <ol>
                <li>编辑<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>一条记录的<strong>姓名</strong>，按 Enter。<br />结果：结束当前编辑后移到同列下一行；按键采用当前表格的 Tab 导航方向。</li>
                <li>进入最后一行的<strong>所学专业</strong>，修改内容后按 Enter。<br />结果：导航回调检测到没有下一个单元格，主动点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="保存数据">保存数据</strong>；后台读取修改数据、保存到示例数据并重新绑定。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>非编辑状态可用方向键移动单元格；Enter 进入编辑，ESC 取消当前编辑。Shift 与导航键组合时按相反方向移动。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TabVerticalNavigate</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>true</code>，确定 Tab 导航方向，Enter 在本页沿用这个方向。
                </li>
                <li><code>EnterSameAsTab</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>true</code>，使 Enter 采用与 Tab 相同的导航规则。
                </li>
                <li><code>beforetabedit</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：<strong>所学专业</strong>列没有下一个单元格时触发保存，并返回 false 取消继续导航；不是在按 ESC 取消编辑时保存。</li>
            </ul>
        </section>
    </template>
</body>
</html>
