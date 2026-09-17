<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_datadisplayfields_group.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownlist.dropdownlist_datadisplayfields_group" %>

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

        .f-field-dropdownlist-pop-groupitem
        {
            padding-left: 20px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false"
            ShowBorder="true" Title="分组+自定义列表项" ShowHeader="true">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableGroup="true">
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
