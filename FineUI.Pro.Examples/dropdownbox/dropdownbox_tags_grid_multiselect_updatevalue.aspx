<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_tags_grid_multiselect_updatevalue.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_tags_grid_multiselect_updatevalue" %>

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
                            </Columns>
                        </f:Grid>
                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnUpdateValue" Text="更新下拉框的值为[陈飞,黄婷婷,张三石]" CssClass="marginr" runat="server" OnClick="btnUpdateValue_Click">
                </f:Button>
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
            <p>在下拉表格中多选人员，按钮请求后台替换选中人员，以标签显示和移除所选人员。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>通过按钮更新选择</h3>
            <ol>
                <li>
                    点击“更新下拉框的值为[陈飞,黄婷婷,张三石]”。<br />
                    结果：回发后由后台把当前选择替换为按钮指定的人名或语言；输入区和重新展开的选择状态同步更新。
                </li>
                <li>
                    再点击“获取下拉框的选中值”。<br />
                    结果：读取结果反映刚更新的选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Values</code>：指定初始多选值。 本页声明值为 105,108。</li>
            </ul>
        </section>
    </template>
</body>
</html>
