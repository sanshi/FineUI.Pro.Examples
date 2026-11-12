<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_dropdownbox_checkboxlist.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_dropdownbox_checkboxlist" %>

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
                        <f:DropDownBox runat="server" ID="DropDownBox1" DataControlID="cblHobby" EmptyText="请选择" EnableMultiSelect="true"
                            AutoShowClearIcon="true" TopSpaceFirst="true">
                            <PopPanel>
                                <f:SimpleForm ID="SimpleForm2" BodyPadding="10px" runat="server" AutoScroll="true" ShowBorder="true" ShowHeader="false"
                                    Hidden="true">
                                    <Items>
                                        <f:CheckBoxList ID="cblHobby" runat="server" ColumnNumber="3">
                                            <f:CheckItem Text="读书" Value="reading" />
                                            <f:CheckItem Text="篮球" Value="basketball" />
                                            <f:CheckItem Text="旅游" Value="travel" />
                                            <f:CheckItem Text="电影" Value="movie" />
                                            <f:CheckItem Text="音乐" Value="music" />
                                        </f:CheckBoxList>
                                    </Items>
                                </f:SimpleForm>
                            </PopPanel>
                        </f:DropDownBox>
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
        var cblHobbyClientID = '<%= cblHobby.ClientID %>';

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function renderHobby(value) {
            if (!value) {
                return '';
            }

            // 兴趣爱好下拉列表的实例
            var cblHobby = F(cblHobbyClientID);

            var hobbies = value.split(',');

            return $.map(hobbies, function(hobby, index) {
                return cblHobby.getTextByValue(hobby);
            }).join(', ');

        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>把下拉复选框列表嵌入单元格编辑器，一次编辑多项兴趣。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>在弹出内容中多选</h3>
            <ol>
                <li>打开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>兴趣爱好</strong>编辑器，在弹出的复选框列表中选中两项，再结束编辑。<br />结果：单元格显示所选兴趣名称，实际值保留对应代码集合；不把名称和选项代码混为同一个字段。</li>
                <li>再次进入同一<strong>兴趣爱好</strong>单元格。<br />结果：编辑器恢复刚才的选择，可继续增减选项。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：[兴趣爱好]列的编辑器属性TopSpaceFirst=true，优先在上部空间显示弹出框。</p>
            <p>注：[兴趣爱好]列的编辑器属性TopSpaceFirst=true，优先在上部空间显示弹出框。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableMultiSelect</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>' title="兴趣爱好列的下拉框">兴趣爱好列的下拉框</strong>）：初始为
                    <code>true</code>，允许下拉编辑器保留多项值。
                </li>
                <li><code>PopPanel</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DropDownBox1").ClientID %>'
                        title="兴趣爱好列的下拉框">兴趣爱好列的下拉框</strong>）：弹出内容由本页的复选框列表或表格提供，取其中的值与文字作为单元格编辑结果。</li>
            </ul>
        </section>
    </template>
</body>
</html>
