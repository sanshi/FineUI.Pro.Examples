<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_showtime_noseconds.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_showtime_noseconds" %>

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
                <f:RenderField Width="180px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd HH:mm" HeaderText="入学日期">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server" DateFormatString="yyyy-MM-dd HH:mm" ShowTime="true" ShowSecond="false">
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
            <p>在单元格日期编辑器中同时选择日期和时间，显示精度保留到分钟，不显示秒。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>修改日期与时间</h3>
            <ul>
                <li>单击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>的<strong>入学日期</strong>，同时调整日期与时间，再结束编辑。<br />结果：单元格按年月日、时分显示结果；重新进入编辑时可继续调整同样精度的时间。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li><strong>入学日期</strong>列（RenderField）：FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd HH:mm"</li>
                <li><strong><strong>入学日期</strong></strong>的编辑表单字段（DatePicker）：DateFormatString="yyyy-MM-dd HH:mm" ShowTime="true" ShowSecond="false"</li>
            </ul>
            <p>为了正确的显示和编辑时间，请注意如下属性：</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowTime</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DatePicker1").ClientID %>' title="入学日期列的日期选择框">入学日期列的日期选择框</strong>）：初始为
                    <code>true</code>，在日期弹层中显示时间选择区。
                </li>
                <li><code>DateFormatString</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("DatePicker1").ClientID %>' title="入学日期列的日期选择框">入学日期列的日期选择框</strong>）：初始为
                    <code>yyyy-MM-dd HH:mm</code>，编辑器按本页格式读取与回显完整日期时间。
                </li>
                <li><code>RendererArgument</code>（<strong>入学日期</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>yyyy-MM-dd HH:mm</code>，单元格采用与编辑器一致的日期时间显示精度。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
