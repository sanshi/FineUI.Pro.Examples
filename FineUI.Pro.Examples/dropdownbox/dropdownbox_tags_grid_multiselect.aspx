<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_tags_grid_multiselect.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_tags_grid_multiselect" %>

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
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MultiSelectMode="Tags" MatchFieldWidth="false"
                    Values="105,108">
                    <PopPanel>
                        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" runat="server" Width="550px" Height="300px" Hidden="true" DataIDField="Id"
                            DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true" EnableCheckBoxSelect="true">
                            <Columns>
                                <f:RowNumberField />
                                <f:RenderField DataField="Name" HeaderText="姓名" />
                                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                                <f:RenderField ColumnID="expander" RenderAsRowExpander="true" DataField="Desc" RendererFunction="renderExpander" />
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
            <p>在下拉表格中多选人员，以标签显示和移除所选人员。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>移除一个选择标签</h3>
            <ol>
                <li>
                    先在下拉面板选择两个可用项，再点击其中一个标签右侧的关闭图标。<br />
                    结果：对应业务值与面板中的选择被取消，其它已选项保持不变。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：如果表格分页，则需要同时指定 Values 和 Text 属性来设置下拉框的初始值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>MultiSelectMode</code>：Tags/tags 将选中的每项显示为可单独移除的标签。 本页声明值为 Tags。</li>
            </ul>
        </section>
    </template>
</body>
</html>
