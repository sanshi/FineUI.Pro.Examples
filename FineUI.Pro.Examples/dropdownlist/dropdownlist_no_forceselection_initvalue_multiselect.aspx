<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_no_forceselection_initvalue_multiselect.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_no_forceselection_initvalue_multiselect" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉列表（用户输入值，初始值，多选）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" 
                    EnableEdit="true" AutoSelectFirstItem="false" ForceSelection="false" EnableMultiSelect="true">
                    <f:ListItem Text="可选项1" Value="Value1" />
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

                <f:Button ID="btnSelectItem6" Text="选中[可选项6]和[可选项4]" runat="server" OnClick="btnSelectItem6_Click" CssClass="marginr">
                </f:Button>
                <f:Button ID="btnSetText" Text="更新为[用户输入值]" runat="server" OnClick="btnSetText_Click" CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false">
        </f:Label>
        <br />
        下拉列表的属性设置为：
        <ul>
            <li>AutoSelectFirstItem="false"：初始不强制选中第一项</li>
            <li>EnableEdit="true"：可以手工编辑</li>
            <li>ForceSelection="false"：用户输入值</li>
            <li>EnableMultiSelect="true"：可以多选</li>
        </ul>
    </form>
</body>
</html>
