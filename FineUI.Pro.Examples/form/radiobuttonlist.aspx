<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="radiobuttonlist.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.radiobuttonlist" %>

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
                <f:RadioButtonList ID="RadioButtonList1" Label="列表一" runat="server">
                    <f:RadioItem Text="可选项 1" Value="value1" />
                    <f:RadioItem Text="可选项 2" Value="value2" />
                    <f:RadioItem Text="可选项 3" Value="value3" />
                </f:RadioButtonList>
                <f:Button ID="btnServerSetSelectedValue" CssClass="marginr" Text="选中上面列表中的第一项" OnClick="btnServerSetSelectedValue_Click" runat="server">
                </f:Button>
                <f:Button ID="btnServerGetSelectedValue" CssClass="marginr" Text="获取上面列表的选中项" OnClick="btnServerGetSelectedValue_Click" runat="server">
                </f:Button>
                <f:Button ID="btnClientGetSelectedValue" Text="获取上面列表的选中项（JavaScript 脚本）" ClickHandler="onAlertSelectedValueClick" runat="server">
                </f:Button>
                <f:Label runat="server">
                </f:Label>
                <f:RadioButtonList ID="RadioButtonList2" Label="列表二（一列）" ColumnNumber="1" runat="server">
                </f:RadioButtonList>
                <f:Label ID="Label3" runat="server">
                </f:Label>
                <f:RadioButtonList ID="RadioButtonList3" Label="列表二（三列）" ColumnNumber="3" runat="server">
                    <f:RadioItem Text="可选项 1" Value="value1" />
                    <f:RadioItem Text="可选项 2" Value="value2" />
                </f:RadioButtonList>
                <f:Label ID="Label1" runat="server">
                </f:Label>
                <f:RadioButtonList ID="rblAutoPostBack" OnSelectedIndexChanged="rblAutoPostBack_SelectedIndexChanged" Label="列表三（自动回发）" ColumnNumber="3"
                    runat="server" ShowRedStar="true" Required="true">
                    <f:RadioItem Text="可选项 1（很长很长很长很长很长很长的可选项）" Value="value1" />
                    <f:RadioItem Text="可选项 2" Value="value2" />
                    <f:RadioItem Text="可选项 3" Value="value3" />
                    <f:RadioItem Text="可选项 4" Value="value4" />
                    <f:RadioItem Text="可选项 5" Value="value5" />
                    <f:RadioItem Text="可选项 6" Value="value6" />
                    <f:RadioItem Text="可选项 7" Value="value7" />
                    <f:RadioItem Text="可选项 8" Value="value8" />
                </f:RadioButtonList>
                <f:Label ID="Label2" runat="server">
                </f:Label>
                <f:RadioButtonList ID="rblVertical" Label="列表四（竖排）" ColumnNumber="3" ColumnVertical="true" runat="server" ShowRedStar="true" Required="true">
                    <f:RadioItem Text="可选项 1" Value="value1" />
                    <f:RadioItem Text="可选项 2" Value="value2" />
                    <f:RadioItem Text="可选项 3" Value="value3" />
                    <f:RadioItem Text="可选项 4" Value="value4" />
                    <f:RadioItem Text="可选项 5" Value="value5" />
                    <f:RadioItem Text="可选项 6" Value="value6" />
                    <f:RadioItem Text="可选项 7" Value="value7" />
                    <f:RadioItem Text="可选项 8" Value="value8" />
                </f:RadioButtonList>

            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="Bottom" runat="server" ToolbarAlign="Right">
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
            var list2 = F('<%= RadioButtonList1.ClientID %>');
            var checkedValue = list2.getValue();
            if (checkedValue) {
                top.F.alert("列表一的选中项：" + checkedValue);
            } else {
                top.F.alert("列表一没有选中项！");
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示单选列表的互斥选择、设置和读取当前值，以及选择变化事件和多列排列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-radio-button-checked" aria-hidden="true"></i>设置并读取单选值</h3>
            <ol>
                <li>
                    点击“选中上面列表中的第一项”。<br />
                    结果：回发后由后台选中列表一的第一项。
                </li>
                <li>
                    在列表一改选第三项，再点击“获取上面列表的选中项”。<br />
                    结果：回发后由后台显示 value3，第一项会自动取消选中。
                </li>
                <li>
                    点击“获取上面列表的选中项（JavaScript 脚本）”。<br />
                    结果：浏览器直接读取并显示同一个当前值，无需回发。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>变化事件和排列方式</h3>
            <ul>
                <li>
                    在“列表三（自动回发）”中切换选项。<br />
                    结果：选择变化后回发，后台显示当前选项值，每次仅保留一项选中。
                </li>
                <li>
                    对照“列表二（一列）”和“列表四（竖排）”。<br />
                    结果：同样是单选列表，前者只有一列，后者分为三列并按列向下排列。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SelectedValue</code>：读取或设置单个选项值，例如 value1。</li>
                <li><code>ColumnNumber</code>：控制列数，本页对比一列和三列。</li>
                <li><code>ColumnVertical</code>：列表四设为 true，优先按列向下排列。</li>
                <li><code>OnSelectedIndexChanged</code>：列表三选择变化时回发，后台显示当前值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
