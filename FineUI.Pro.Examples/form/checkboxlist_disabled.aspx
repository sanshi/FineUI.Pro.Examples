<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkboxlist_disabled.aspx.cs" Inherits="FineUI.Pro.Examples.form.checkboxlist_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" LabelWidth="160px" EnableCollapse="false"
            BodyPadding="10px" ShowBorder="true" ShowHeader="true" Title="简单表单">
            <Items>
                <f:CheckBoxList ID="CheckBoxList1" Label="列表一" runat="server">
                    <f:CheckItem Text="可选项 1" Value="value1" Enabled="false" />
                    <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                    <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                </f:CheckBoxList>
                <f:Panel CssClass="f-field" ShowBorder="false" ShowHeader="false" runat="server">
                    <Items>
                        <f:Button ID="btnServerSetSelectedValue" CssClass="marginr" Text="选中上面列表中的第一项和第三项" OnClick="btnServerSetSelectedValue_Click"
                            runat="server">
                        </f:Button>
                        <f:Button ID="btnServerGetSelectedValue" CssClass="marginr" Text="获取上面列表的选中项" OnClick="btnServerGetSelectedValue_Click"
                            runat="server">
                        </f:Button>
                        <f:Button ID="btnClientGetSelectedValue" Text="获取上面列表的选中项（JavaScript 脚本）" ClickHandler="onAlertSelectedValueClick" runat="server">
                        </f:Button>
                    </Items>
                </f:Panel>
                <f:CheckBoxList ID="CheckBoxList2" Label="列表二（一列）" ColumnNumber="1" runat="server">
                </f:CheckBoxList>
            </Items>
            <Toolbars>
                <f:Toolbar Position="Bottom" ToolbarAlign="Right" runat="server">
                    <Items>
                        <f:Button runat="server" ID="btnSubmit" ValidateForms="SimpleForm1" Text="提交表单"
                            OnClick="btnSubmit_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
    </form>
    <script type="text/javascript">

        function onAlertSelectedValueClick(event) {
            var list2 = F('<%= CheckBoxList1.ClientID %>');

            var selectedValues = list2.getValue();
            if (selectedValues.length) {
                top.F.alert("列表一的选中项：" + selectedValues.join(','));
            } else {
                top.F.alert("列表一没有选中项！");
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对比禁用选项与可用选项，禁用只限制用户直接操作。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>检查禁用选项</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= CheckBoxList1.ClientID %>" title="列表一">列表一</strong>中禁用的“可选项 <code>1</code>”。<br />
                    结果：用户点击不能改变该选项的选中状态。
                </li>
                <li>
                    保持或勾选<strong class="example-control-reference" data-example-control="<%= CheckBoxList1.ClientID %>" title="列表一">列表一</strong>的“可选项 <code>2</code>”，再点击获取选中项按钮。<br />
                    结果：显示当前选择中包含 <code>value2</code>。
                </li>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnServerSetSelectedValue.ClientID %>" title="选中上面列表中的第一项和第三项">选中上面列表中的第一项和第三项</strong>。<br />
                    结果：代码赋值可以更新禁用项的选中状态；禁用仍阻止用户直接点击修改。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Enabled</code>（<strong class="example-control-reference" data-example-control="<%= CheckBoxList1.ClientID %>" title="列表一">列表一</strong>、<strong class="example-control-reference" data-example-control="<%= CheckBoxList2.ClientID %>" title="列表二（一列）">列表二（一列）</strong>）：列表项为 <code>false</code> 时，用户不能直接选择；后台设置选择不受用户点击限制。 本页声明值为 <code>false</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
