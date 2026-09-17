<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_customitem.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_customitem" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .item-text {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .item-desc {
            font-size: 0.9em;
            word-break: break-all;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="自定义列表项（列表项绑定事件）" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" OnItemDataBound="DropDownList1_ItemDataBound">
                </f:DropDownList>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
    </form>
</body>
</html>
