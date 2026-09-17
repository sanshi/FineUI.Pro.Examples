<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_selectedvaluearray.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist_selectedvaluearray" %>

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
                    <Items>
                        <f:Button runat="server" Text="获取选中项" ID="btnSubmit" OnClick="btnSubmit_Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:DataList runat="server" ID="DataList1" OnItemDataBound="DataList1_ItemDataBound"
                    EnableSelect="true" EnableMultiSelect="true" DataValueField="Id">
                </f:DataList>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
