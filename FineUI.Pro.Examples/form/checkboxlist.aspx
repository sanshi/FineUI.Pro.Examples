<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkboxlist.aspx.cs" Inherits="FineUI.Pro.Examples.form.checkboxlist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" LabelWidth="160px" EnableCollapse="false" BodyPadding="10px" ShowBorder="true"
            ShowHeader="true" Title="简单表单">
            <Items>
                <f:CheckBoxList ID="CheckBoxList1" Label="列表一" runat="server">
                    <f:CheckItem Text="可选项 1" Value="value1" />
                    <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                    <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                </f:CheckBoxList>
                <f:Panel CssClass="f-field" ShowBorder="false" ShowHeader="false" runat="server">
                    <Items>
                        <f:Button ID="btnServerSetSelectedValue" CssClass="marginr" Text="选中上面列表中的第一项和第三项" OnClick="btnServerSetSelectedValue_Click"
                            runat="server">
                        </f:Button>
                        <f:Button ID="btnServerGetSelectedValue" CssClass="marginr" Text="获取上面列表的选中项" OnClick="btnServerGetSelectedValue_Click" runat="server">
                        </f:Button>
                        <f:Button ID="btnClientGetSelectedValue" Text="获取上面列表的选中项（JavaScript 脚本）" ClickHandler="onAlertSelectedValueClick" runat="server">
                        </f:Button>
                    </Items>
                </f:Panel>
                <f:CheckBoxList ID="CheckBoxList2" Label="列表二（一列）" ColumnNumber="1" runat="server">
                </f:CheckBoxList>
                <f:CheckBoxList ID="RadioButtonList3" Label="列表二（三列）" ColumnNumber="3" runat="server">
                    <f:CheckItem Text="可选项 1" Value="value1" />
                    <f:CheckItem Text="可选项 2" Value="value2" />
                </f:CheckBoxList>
                <f:CheckBoxList ID="rblAutoPostBack" OnSelectedIndexChanged="rblAutoPostBack_SelectedIndexChanged" Label="列表三（自动回发）" ColumnNumber="3"
                    runat="server" ShowRedStar="true" Required="true">
                    <f:CheckItem Text="可选项 1（很长很长很长很长很长很长的可选项）" Value="value1" />
                    <f:CheckItem Text="可选项 2" Value="value2" />
                    <f:CheckItem Text="可选项 3" Value="value3" />
                    <f:CheckItem Text="可选项 4" Value="value4" />
                    <f:CheckItem Text="可选项 5" Value="value5" />
                    <f:CheckItem Text="可选项 6" Value="value6" />
                    <f:CheckItem Text="可选项 7" Value="value7" />
                    <f:CheckItem Text="可选项 8" Value="value8" />
                </f:CheckBoxList>
                <f:CheckBoxList ID="rblVertical" Label="列表四（竖排）" ColumnNumber="3" ColumnVertical="true" runat="server" ShowRedStar="true" Required="true">
                    <f:CheckItem Text="可选项 1" Value="value1" />
                    <f:CheckItem Text="可选项 2" Value="value2" />
                    <f:CheckItem Text="可选项 3" Value="value3" />
                    <f:CheckItem Text="可选项 4" Value="value4" />
                    <f:CheckItem Text="可选项 5" Value="value5" />
                    <f:CheckItem Text="可选项 6" Value="value6" />
                    <f:CheckItem Text="可选项 7" Value="value7" />
                    <f:CheckItem Text="可选项 8" Value="value8" />
                </f:CheckBoxList>
            </Items>
            <Toolbars>
                <f:Toolbar Position="Bottom" ToolbarAlign="Right" runat="server">
                    <Items>
                        <f:Button runat="server" ID="btnSubmit" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
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
            <p>演示复选框列表的多项选择、设置和读取选中值，以及不同列数和方向的排列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check-box-checked" aria-hidden="true"></i>设置并读取多选值</h3>
            <ol>
                <li>
                    点击“选中上面列表中的第一项和第三项”。<br />
                    结果：回发后由后台将列表一选为第一项和第三项，第二项取消选中。
                </li>
                <li>
                    点击“获取上面列表的选中项”。<br />
                    结果：回发后由后台显示 value1、value3 这两个选项值。
                </li>
                <li>
                    手动改变列表一的勾选，再点击“获取上面列表的选中项（JavaScript 脚本）”。<br />
                    结果：浏览器直接读取当前选中值数组并弹出显示，无需回发。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>变化事件和排列方式</h3>
            <ul>
                <li>
                    勾选“列表三（自动回发）”中的任意项。<br />
                    结果：选择变化后回发，由后台显示列表三的当前选中值。
                </li>
                <li>
                    对照“列表二（一列）”和“列表四（竖排）”。<br />
                    结果：列表二逐行排列，列表四分成三列并优先按列向下排列；多选规则相同。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SelectedValueArray</code>：读取或设置多个选项值，本例可设为 value1、value3。</li>
                <li><code>ColumnNumber</code>：列表二为 1，列表三和列表四为 3。</li>
                <li><code>ColumnVertical</code>：列表四设为 true，优先按列向下排列。</li>
                <li><code>OnSelectedIndexChanged</code>：列表三选择变化后回发，后台返回当前选中值。</li>
                <li><code>Required</code>：列表三和列表四必须各选至少一项，提交表单时检查。</li>
            </ul>
        </section>
    </template>
</body>
</html>
