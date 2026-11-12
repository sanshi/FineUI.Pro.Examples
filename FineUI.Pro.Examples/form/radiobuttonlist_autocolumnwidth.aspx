<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="radiobuttonlist_autocolumnwidth.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.radiobuttonlist_autocolumnwidth" %>

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
                <f:RadioButtonList ID="RadioButtonList1" Label="列表一" runat="server" AutoColumnWidth="true">
                    <f:RadioItem Text="可选项 1（宽度自适应）" Value="value1" />
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
                <f:RadioButtonList ID="RadioButtonList2" Label="列表二（三列）" ColumnNumber="3" runat="server" AutoColumnWidth="true">
                </f:RadioButtonList>
                <f:Label ID="Label3" runat="server">
                </f:Label>
                <f:RadioButtonList ID="RadioButtonList3" Label="列表二（三列）" ColumnNumber="3" runat="server" AutoColumnWidth="true">
                    <f:RadioItem Text="可选项 1" Value="value1" />
                    <f:RadioItem Text="可选项 2" Value="value2" />
                </f:RadioButtonList>
                <f:Label ID="Label1" runat="server">
                </f:Label>
                <f:RadioButtonList ID="rblAutoPostBack" OnSelectedIndexChanged="rblAutoPostBack_SelectedIndexChanged" Label="列表三（自动回发）" ColumnNumber="3"
                    runat="server" ShowRedStar="true" Required="true" AutoColumnWidth="true">
                    <f:RadioItem Text="可选项 1（这个很长）" Value="value1" />
                    <f:RadioItem Text="可选项 2" Value="value2" />
                    <f:RadioItem Text="可选项 3" Value="value3" />
                    <f:RadioItem Text="可选项 4" Value="value4" />
                    <f:RadioItem Text="可选项 5（宽度自适应）" Value="value5" />
                    <f:RadioItem Text="可选项 6" Value="value6" />
                    <f:RadioItem Text="可选项 7" Value="value7" />
                    <f:RadioItem Text="可选项 8" Value="value8" />
                </f:RadioButtonList>
                <f:Label ID="Label2" runat="server">
                </f:Label>
                <f:RadioButtonList ID="rblVertical" Label="列表四（竖排）" ColumnNumber="3" ColumnVertical="true" runat="server" ShowRedStar="true" Required="true"
                    AutoColumnWidth="true">
                    <f:RadioItem Text="可选项 1" Value="value1" />
                    <f:RadioItem Text="可选项 2" Value="value2" />
                    <f:RadioItem Text="可选项 3" Value="value3" />
                    <f:RadioItem Text="可选项 4（宽度自适应）" Value="value4" />
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
            <p>演示按选项文字的实际长度自动分配列表列宽，避免长短选项按等宽排列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>比较长短选项</h3>
            <ol>
                <li>
                    对照列表中较长的第一项与较短的“可选项 2”。<br />
                    结果：各项按自身文字宽度排布，长文字项比短文字项占用更大宽度。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：注意复选框列表中每一项的宽度不相同。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ColumnNumber</code>：决定列表分为几列。 本页“列表二（三列）”声明值为 3。</li>
                <li><code>AutoColumnWidth</code>：选项宽度按各项文字内容调整。 本页“列表一”声明值为 true。</li>
            </ul>
        </section>
    </template>
</body>
</html>
