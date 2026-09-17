<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_no_forceselection.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_no_forceselection" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉列表（用户输入值）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableEdit="true" ForceSelection="false">
                    <f:ListItem Text="可选项1" Value="Value1" Selected="true" />
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" />
                    <f:ListItem Text="可选项5" Value="Value5" />
                    <f:ListItem Text="可选项6" Value="Value6" />
                    <f:ListItem Text="可选择项7" Value="Value7" />
                    <f:ListItem Text="可选择项8" Value="Value8" />
                    <f:ListItem Text="可选择项9" Value="Value9" />
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
        注：下拉列表的EnableEdit=true、ForceSelection=false，可以输入用户自定义文本。
        <br />
        <br />
        测试用例（初始文本："可选项1"）：
        <ul>
            <li>
                依次删除："1项"；然后在页面上点击一下，使得文本框失去焦点；点击获取选中项按钮："用户输入值：可选"
            </li>
            <li>
                依次删除全部文本；然后在页面上点击一下，使得文本框失去焦点；点击获取选中项按钮："无选中项"
            </li>
            <li>
                依次删除："1项"；然后再依次输入："项5"；按回车键；点击获取选中项按钮："<strong class="highlight">选中项：可选项5（值：Value5）</strong>"
            </li>
            <li>
                依次删除："1项"；然后再依次输入："项5"；然后在页面上点击一下，使得文本框失去焦点；点击获取选中项按钮："<strong class="highlight">选中项：可选项5（值：Value5）</strong>"
            </li>
        </ul>
    </form>
</body>
</html>
