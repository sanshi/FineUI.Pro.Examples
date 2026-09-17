<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_more.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist_more" %>

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

        .morebutton {
            width: 100%;
            text-align: center;
            margin: 8px 0;
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
                <f:DataList runat="server" ID="DataList1" AttributeDataTag="0" OnItemDataBound="DataList1_ItemDataBound">
                </f:DataList>
                <f:LinkButton runat="server" CssClass="morebutton" Text="加载更多..." ID="btnMore" OnClick="btnMore_Click"></f:LinkButton>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
