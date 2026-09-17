<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_image_title.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist_image_title" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../../res/css/datalist.css" rel="stylesheet" />
    <style>
        .item-desc {
            word-break: break-all;
            white-space: normal;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" AutoScroll="true" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Title="列表" runat="server" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:DataList runat="server" ID="DataList1" OnItemDataBound="DataList1_ItemDataBound">
                </f:DataList>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
