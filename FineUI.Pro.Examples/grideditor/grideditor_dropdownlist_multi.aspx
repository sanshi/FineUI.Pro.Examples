<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_dropdownlist_multi.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_dropdownlist_multi" %>

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
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="入学日期">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Hobby" DataField="Hobby" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="兴趣爱好" RendererFunction="renderHobby">
                    <Editor>
                        <f:DropDownList ID="ddlHobby" runat="server" EnableMultiSelect="true" TopSpaceFirst="true" MultiSelectMode="Tags">
                            <f:ListItem Text="读书" Value="reading" />
                            <f:ListItem Text="篮球" Value="basketball" />
                            <f:ListItem Text="旅游" Value="travel" />
                            <f:ListItem Text="电影" Value="movie" />
                            <f:ListItem Text="音乐" Value="music" />
                        </f:DropDownList>
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
        var ddlHobbyClientID = '<%= ddlHobby.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function renderHobby(value) {
            // 兴趣爱好下拉列表的实例
            var ddlHobby = F(ddlHobbyClientID);

            var hobbies = value.split(',');

            return $.map(hobbies, function(hobby, index) {
                return ddlHobby.getTextByValue(hobby);
            }).join(', ');

        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把可多选的下拉列表用作兴趣爱好单元格编辑器，显示名称并保存多项值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>在同一单元格选择多个兴趣</h3>
            <ul>
                <li>打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>兴趣爱好</strong>编辑器，选中两项后结束编辑，再次打开。<br />结果：单元格显示多个兴趣名称；重新编辑时对应选项仍被选中，取消其中一项后只保留其余项。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：[兴趣爱好]列的编辑器属性TopSpaceFirst=true，优先在上部空间显示弹出框。</p>
            <p>注：[兴趣爱好]列的编辑器属性TopSpaceFirst=true，优先在上部空间显示弹出框。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableMultiSelect</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlHobby").ClientID %>' title="兴趣爱好列的下拉列表">兴趣爱好列的下拉列表</strong>）：初始为
                    <code>true</code>，同一个下拉编辑器可同时保留多个选项。
                </li>
                <li><code>RendererFunction</code>（<strong>兴趣爱好列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：把保存的多项值转换为对应选项文字，显示文字与实际值分别处理。</li>
            </ul>
        </section>
    </template>
</body>
</html>
