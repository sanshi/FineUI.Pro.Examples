<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_no_forceselection_empty.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_no_forceselection_empty" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="下拉列表（用户输入值，初始值，下拉选项为空）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableEdit="true" AutoSelectFirstItem="false" ForceSelection="false">
                </f:DropDownList>
                <f:Button ID="btnRebindData" Text="重新绑定数据" runat="server" OnClick="btnRebindData_Click" CssClass="marginr">
                </f:Button>
                <f:Button ID="btnSetText" Text="更新为[用户输入值]" runat="server" OnClick="btnSetText_Click" CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        下拉列表的属性设置为：
        <ul>
            <li>AutoSelectFirstItem="false"：初始不强制选中第一项</li>
            <li>EnableEdit="true"：可以手工编辑</li>
            <li>ForceSelection="false"：用户输入值</li>
        </ul>
    </form>
</body>
</html>
