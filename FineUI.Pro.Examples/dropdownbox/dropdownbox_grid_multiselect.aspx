<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_multiselect.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_multiselect" %>

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
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MatchFieldWidth="false" Values="105,108">
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
            <p>在下拉表格中多选人员。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check-box" aria-hidden="true"></i>保留多个选择</h3>
            <ol>
                <li>
                    展开面板，选择两个可用项，再取消其中一个。<br />
                    结果：两个选择可以同时保留；取消一项不会清除另一项。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：如果表格分页，则需要同时指定 Values 和 Text 属性来设置下拉框的初始值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableMultiSelect</code>：决定下拉框保留单个值还是多个值。 本页声明值为 true。</li>
                <li><code>KeepCurrentSelection</code>：在继续选择或翻页时保留已有选择。 本页声明值为 true。</li>
                <li><code>EnableCheckBoxSelect</code>：用复选框列选择表格行。 本页声明值为 true。</li>
            </ul>
        </section>
    </template>
</body>
</html>
