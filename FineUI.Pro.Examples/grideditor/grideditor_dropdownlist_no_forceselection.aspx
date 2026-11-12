<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_dropdownlist_no_forceselection.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_dropdownlist_no_forceselection" %>

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
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业" RendererFunction="renderMajor">
                    <Editor>
                        <f:DropDownList ID="ddlMajor" Required="true" EnableEdit="true" ForceSelection="false" runat="server">
                            <f:ListItem Text="材料科学与工程系" Value="材料科学与工程系"></f:ListItem>
                            <f:ListItem Text="化学系" Value="化学系"></f:ListItem>
                            <f:ListItem Text="数学系" Value="数学系"></f:ListItem>
                            <f:ListItem Text="物理系" Value="物理系"></f:ListItem>
                            <f:ListItem Text="自动化系" Value="自动化系"></f:ListItem>
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
        var ddlGenderID = '<%= ddlGender.ClientID %>';

        function renderGender(value) {
            return F(ddlGenderID).getTextByValue(value);
        }


        var ddlMajorID = '<%= ddlMajor.ClientID %>';

        function renderMajor(value) {
            return F(ddlMajorID).getTextByValue(value);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>允许专业下拉编辑器接收列表以外的输入，不强制用户只能选择已有专业。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>输入不存在于列表中的专业</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>打开<strong>所学专业</strong>编辑器，直接输入<code>新的专业名称</code>并结束编辑。<br />结果：输入文字保留为该单元格的新值，不会因为没有同名选项而退回旧值；已有选项仍可直接选择。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ForceSelection</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlMajor").ClientID %>' title="所学专业列的下拉列表">所学专业列的下拉列表</strong>）：初始为
                    <code>false</code>，允许把用户输入的文字作为单元格值。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
