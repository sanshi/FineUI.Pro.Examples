<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_enableedit_filter.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_enableedit_filter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉列表（可编辑，强制选择）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableEdit="true" FilterFunction="filterDropDownList1">
                    <f:ListItem Text="可选项1" Value="Value1" Selected="true" />
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" />
                    <f:ListItem Text="可选项5" Value="Value5" />
                    <f:ListItem Text="可选项6" Value="Value6" />
                    <f:ListItem Text="选择项7" Value="Value7" />
                    <f:ListItem Text="选择项8" Value="Value8" />
                    <f:ListItem Text="选择项9" Value="Value9" />
                    <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />
                </f:DropDownList>
                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        注：用户输入文本时，会从第一个字符开始匹配（尝试输入字符：选）。
    </form>
    <script>

        function filterDropDownList1(filterText, listItemText) {
            // 返回false则排除当前列表项
            if (!F.startsWith(filterText.toLowerCase(), listItemText.toLowerCase())) {
                return false;
            }
        }

    </script>
</body>
</html>
