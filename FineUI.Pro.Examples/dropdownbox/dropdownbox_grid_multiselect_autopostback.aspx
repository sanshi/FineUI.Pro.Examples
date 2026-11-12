<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_multiselect_autopostback.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_multiselect_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉表格（多选，自动回发）"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MatchFieldWidth="false"
                    OnTextChanged="DropDownBox1_TextChanged">
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
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        <f:Label runat="server" ID="labResult2">
        </f:Label>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在下拉表格中多选人员，收起面板确认变化后回发显示当前值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-send" aria-hidden="true"></i>收起面板后处理变化</h3>
            <ol>
                <li>
                    改变面板中的选择，再点击面板外空白处收起。<br />
                    结果：文本变化事件回发后显示当前选择结果；此处核对的是确认并收起后的值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnTextChanged</code>：下拉选择变化后处理当前文字；需在收起弹出面板、确认本次选择后核对结果。 本页声明值为 DropDownBox1_TextChanged。</li>
            </ul>
        </section>
    </template>
</body>
</html>
