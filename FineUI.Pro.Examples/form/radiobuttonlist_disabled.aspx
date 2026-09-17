<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="radiobuttonlist_disabled.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.radiobuttonlist_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" LabelWidth="160px" EnableCollapse="false"
            BodyPadding="10px" ShowBorder="true" ShowHeader="true"
            Title="简单表单">
            <Items>
                <f:RadioButtonList ID="RadioButtonList1" Label="列表一" runat="server">
                    <f:RadioItem Text="可选项 1" Value="value1" Enabled="false" />
                    <f:RadioItem Text="可选项 2" Value="value2" />
                    <f:RadioItem Text="可选项 3" Value="value3" />
                </f:RadioButtonList>
                <f:Button ID="btnServerSetSelectedValue" CssClass="marginr" Text="选中上面列表中的第一项" OnClick="btnServerSetSelectedValue_Click"
                    runat="server">
                </f:Button>
                <f:Button ID="btnServerGetSelectedValue" CssClass="marginr" Text="获取上面列表的选中项" OnClick="btnServerGetSelectedValue_Click"
                    runat="server">
                </f:Button>
                <f:Button ID="btnClientGetSelectedValue" Text="获取上面列表的选中项（JavaScript 脚本）" ClickHandler="onAlertSelectedValueClick" runat="server">
                </f:Button>
                <f:Label runat="server"></f:Label>
                <f:RadioButtonList ID="RadioButtonList2" Label="列表二（一列）" ColumnNumber="1" runat="server">
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
</body>
</html>
