<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_multiselect_enableedit.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_multiselect_enableedit" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉表格（多选）"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MatchFieldWidth="false" Values="105,108"
                    EnableEdit="true">
                    <PopPanel>
                        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" runat="server" Width="550px" Height="300px" Hidden="true" DataIDField="Id"
                            DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true" EnableCheckBoxSelect="true">
                            <Columns>
                                <f:RowNumberField />
                                <f:RenderField DataField="Name" HeaderText="姓名" />
                                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                            </Columns>
                        </f:Grid>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" CssClass="marginr" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
                <f:Button ID="btnReset" Text="重置表单" runat="server" ClickHandler="onResetClick">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var SimpleForm1ClientID = '<%= SimpleForm1.ClientID %>';

        function onResetClick(event) {
            F(SimpleForm1ClientID).reset();
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="下拉表格（多选）">下拉表格</strong>中多选人员，也可保留用户自由输入文字。
            </p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>输入列表之外的文字</h3>
            <ol>
                <li>
                    先取消现有选择，再在输入区键入“自定义说明”，收起面板或离开字段。<br />
                    结果：输入区保留用户输入文字，不把它误认为某个已有的业务值；获取时按用户输入值处理。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableEdit</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下拉表格中选择">请从下拉表格中选择</strong>）：允许输入列表之外的文字，选中项与自由输入按不同方式读取。 本页声明值为 <code>true</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
