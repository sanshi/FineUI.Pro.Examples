<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_autopostback.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="简单下拉列表（自动回发）"
            ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <f:ListItem Text="可选项1" Value="Value1" />
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" />
                    <f:ListItem Text="可选项5" Value="Value5" />
                    <f:ListItem Text="可选项6" Value="Value6" />
                    <f:ListItem Text="可选择项7" Value="Value7" />
                    <f:ListItem Text="可选择项8" Value="Value8" />
                    <f:ListItem Text="普通型1 &lt; L &gt; 1.5" Value="普通型1 &lt; L &gt; 1.5" />
                </f:DropDownList>
                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click" CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        <br />
        测试用例：
        <ul>
            <li>
                初始文本：可选项1；点击触发图标，显示下拉列表；点击：可选项5；显示文本：可选项5；触发回发事件
            </li>
            <li>
                初始文本：可选项1；点击按钮：选中[可选项6]；显示文本：可选项6；<strong class="highlight">不会</strong>触发回发事件
            </li>
        </ul>
    </form>
</body>
</html>
