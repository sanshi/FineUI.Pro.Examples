<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkboxlist_autocolumnwidth.aspx.cs" Inherits="FineUI.Pro.Examples.form.checkboxlist_autocolumnwidth" %>

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
                <f:CheckBoxList ID="CheckBoxList1" Label="列表一" runat="server" AutoColumnWidth="true">
                    <f:CheckItem Text="可选项 1（宽度自适应）" Value="value1" />
                    <f:CheckItem Text="可选项 2" Value="value2" Selected="true" />
                    <f:CheckItem Text="可选项 3" Value="value3" Selected="true" />
                </f:CheckBoxList>
                <f:Button ID="btnServerSetSelectedValue" CssClass="marginr" Text="选中上面列表中的第一项和第三项" OnClick="btnServerSetSelectedValue_Click" runat="server">
                </f:Button>
                <f:Button ID="btnServerGetSelectedValue" CssClass="marginr" Text="获取上面列表的选中项" OnClick="btnServerGetSelectedValue_Click" runat="server">
                </f:Button>
                <f:Button ID="btnClientGetSelectedValue" Text="获取上面列表的选中项（JavaScript 脚本）" ClickHandler="onAlertSelectedValueClick" runat="server">
                </f:Button>
                <f:Label runat="server">
                </f:Label>
                <f:CheckBoxList ID="CheckBoxList2" Label="列表二（三列）" ColumnNumber="3" runat="server" AutoColumnWidth="true">
                </f:CheckBoxList>
                <f:Label ID="Label3" runat="server">
                </f:Label>
                <f:CheckBoxList ID="RadioButtonList3" Label="列表二（三列）" ColumnNumber="3" runat="server" AutoColumnWidth="true">
                    <f:CheckItem Text="可选项 1" Value="value1" />
                    <f:CheckItem Text="可选项 2" Value="value2" />
                </f:CheckBoxList>
                <f:Label ID="Label1" runat="server">
                </f:Label>
                <f:CheckBoxList ID="rblAutoPostBack" OnSelectedIndexChanged="rblAutoPostBack_SelectedIndexChanged" Label="列表三（自动回发）" ColumnNumber="3"
                    runat="server" ShowRedStar="true" Required="true" AutoColumnWidth="true">
                    <f:CheckItem Text="可选项 1（这个很长）" Value="value1" />
                    <f:CheckItem Text="可选项 2" Value="value2" />
                    <f:CheckItem Text="可选项 3" Value="value3" />
                    <f:CheckItem Text="可选项 4" Value="value4" />
                    <f:CheckItem Text="可选项 5（宽度自适应）" Value="value5" />
                    <f:CheckItem Text="可选项 6" Value="value6" />
                    <f:CheckItem Text="可选项 7" Value="value7" />
                    <f:CheckItem Text="可选项 8" Value="value8" />
                </f:CheckBoxList>
                <f:Label ID="Label2" runat="server">
                </f:Label>
                <f:CheckBoxList ID="rblVertical" Label="列表四（竖排）" ColumnNumber="3" ColumnVertical="true" runat="server" ShowRedStar="true" Required="true"
                    AutoColumnWidth="true">
                    <f:CheckItem Text="可选项 1" Value="value1" />
                    <f:CheckItem Text="可选项 2" Value="value2" />
                    <f:CheckItem Text="可选项 3" Value="value3" />
                    <f:CheckItem Text="可选项 4（宽度自适应）" Value="value4" />
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
        <br />
        <br />
        注：注意复选框列表中每一项的宽度不相同。
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
</body>
</html>
