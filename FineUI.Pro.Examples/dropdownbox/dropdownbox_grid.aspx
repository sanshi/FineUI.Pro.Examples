<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉表格" ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" MatchFieldWidth="false" Values="105" EnableMultiSelect="false">
                    <PopPanel>
                        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" runat="server" DataIDField="Id" DataTextField="Name" Hidden="true" Width="550px"
                            Height="300px" EnableMultiSelect="false">
                            <Columns>
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
            <p>在<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="下拉表格">下拉表格</strong>中单选人员。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-radio-button-checked" aria-hidden="true"></i>选择并读取人员</h3>
            <ol>
                <li>
                    展开<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="下拉表格">下拉表格</strong>中选择<code>董婷婷</code>。<br />
                    结果：该人员成为唯一选择，值为 <code>103</code>。
                </li>
                <li>
                    收起可收起的面板后，点击<strong class="example-control-reference" data-example-control="<%= btnGetSelection.ClientID %>" title="获取下拉框的选中值">获取下拉框的选中值</strong>。<br />
                    结果：回发后由后台显示当前人员名称及业务值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>恢复初始选择</h3>
            <ol>
                <li>
                    修改选择后点击<strong class="example-control-reference" data-example-control="<%= btnReset.ClientID %>" title="重置表单">重置表单</strong>。<br />
                    结果：客户端恢复页面初始的选择值和显示文字，不再保留刚改选的人员。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：如果表格分页，则需要同时指定 <code>Values</code> 和 <code>Text</code> 属性来设置<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">下拉框</strong>的初始值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableMultiSelect</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">请从下拉表格中选择</strong>）：决定<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">下拉框</strong>保留单个值还是多个值。 本页声明值为 <code>false</code>。</li>
                <li><code>Values</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">请从下拉表格中选择</strong>）：指定初始多选值。 本页声明值为 <code>105</code>。</li>
                <li><code>MatchFieldWidth</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">请从下拉表格中选择</strong>）：控制弹出面板是否强制匹配字段宽度。 本页声明值为 <code>false</code>。</li>
                <li><code>DataIDField</code>（<strong class="example-control-reference" data-example-control="<%= Grid1.ClientID %>" title="表格">表格</strong>）：从数据对象指定字段取得行值。 本页声明值为 <code>Id</code>。</li>
                <li><code>DataTextField</code>（<strong class="example-control-reference" data-example-control="<%= Grid1.ClientID %>" title="表格">表格</strong>）：从指定字段取得选中后显示的人员名称。 本页声明值为 <code>Name</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
