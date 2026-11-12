<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_checkboxfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_checkboxfield" %>

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
                <f:RenderCheckField Width="150px" ColumnID="AtSchool" DataField="AtSchool" HeaderText="RenderCheckField" />
                <f:RenderCheckField ColumnID="CheckBoxField1" Width="150px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="CheckBoxField1" />
                <f:RenderCheckField ColumnID="CheckBoxField2" Width="150px" RenderAsStaticField="false" DataField="AtSchool" HeaderText="CheckBoxField2" />
                <f:RenderField ColumnID="Major" DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="获取复选框列的状态（CheckBoxField2）" ClickHandler="onReadCheckStatesClick">
        </f:Button>
        <br />
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onReadCheckStatesClick(event) {
            var grid = F('<%= Grid1.ClientID %>');
            F.customEvent('CheckSelectedRows', {
                rows: getGridCheckRows(grid, ["CheckBoxField2"], true)
            });
            return false;
        }

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照布尔列的可编辑复选框与静态图标模式，读取指定列的正文勾选状态。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>对照三列布尔值</h3>
            <ol>
                <li>分别点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>中的 <strong><strong>RenderCheckField</strong></strong>、<strong><strong>CheckBoxField1</strong></strong>
                    和 <strong><strong>CheckBoxField2</strong></strong>。<br />结果：<strong><strong>RenderCheckField</strong></strong> 与
                    <strong><strong>CheckBoxField2</strong></strong> 可切换勾选；<strong><strong>CheckBoxField1</strong></strong> 只显示静态状态图标，不能通过点击编辑。三列初始都从 AtSchool
                    字段取值。
                </li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="获取复选框列的状态（CheckBoxField2）">获取复选框列的状态（CheckBoxField2）</strong>。<br />结果：客户端读取 <strong><strong>CheckBoxField2</strong></strong>
                    各行的勾选状态并回发，后台在下方显示结果；这个入口读取的不是整行选择。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RenderAsStaticField</code>（<strong>CheckBoxField1</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>true</code>，为 true 时显示静态图标，为 false 时显示可操作的复选框。
                </li>
                <li><code>RenderAsStaticField</code>（<strong>CheckBoxField2</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：初始为
                    <code>false</code>，为 true 时显示静态图标，为 false 时显示可操作的复选框。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
