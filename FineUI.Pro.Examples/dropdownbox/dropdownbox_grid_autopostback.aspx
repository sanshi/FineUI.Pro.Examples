<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_autopostback.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_autopostback" %>

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
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" MatchFieldWidth="false" OnTextChanged="DropDownBox1_TextChanged"
                    EnableMultiSelect="false">
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
        <br />
        <f:Label runat="server" ID="labResult2">
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
            <p>在<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="下拉表格">下拉表格</strong>中单选人员，收起面板确认变化后回发显示当前值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-send" aria-hidden="true"></i>收起面板后处理变化</h3>
            <ol>
                <li>
                    改变面板中的选择，再点击面板外空白处收起。<br />
                    结果：文本变化事件回发后显示当前选择结果；此处核对的是确认并收起后的值。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：示例站在 <code>Web.config</code> 中全局设置 <code>EnableImplicitChangeEvents</code>="<code>false</code>"。 <strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">下拉框</strong>的 <code>TextChanged</code> 只在用户选中表格行时主动回发；其他按钮发起的回发不会顺带触发它。</p>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control="<%= SimpleForm1.ClientID %>" title="下拉表格">下拉表格</strong>中选中一行：立即回发，触发<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">下拉框</strong>的 <code>TextChanged</code> 事件。</li>
                <li>点击[<strong class="example-control-reference" data-example-control="<%= btnReset.ClientID %>" title="重置表单">重置表单</strong>]：仅在浏览器中清空选中值，不发起回发。</li>
                <li>点击[<strong class="example-control-reference" data-example-control="<%= btnGetSelection.ClientID %>" title="获取下拉框的选中值">获取下拉框的选中值</strong>]：回发并读取当前值，只触发按钮的 <code>Click</code> 事件。即使刚刚重置了选中值，也不会顺带触发 <code>TextChanged</code>。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnTextChanged</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">请从下拉表格中选择</strong>）：下拉选择变化后处理当前文字；需在收起弹出面板、确认本次选择后核对结果。 本页声明值为 <code>DropDownBox1</code><code>_TextChanged</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
