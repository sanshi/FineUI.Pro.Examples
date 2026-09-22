<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist_selectedvaluearray_keepcurrentselection.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist_selectedvaluearray_keepcurrentselection" %>

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
                <f:Toolbar ID="ToolbarActions" runat="server">
                    <Items>
                        <f:Button ID="btnSetSelection" Text="设置选择" OnClick="btnSetSelection_Click" runat="server"></f:Button>
                        <f:Button ID="btnClearSelection" Text="清空选择" OnClick="btnClearSelection_Click" runat="server"></f:Button>
                        <f:Button ID="btnRebindSelection" Text="重绑并选中" OnClick="btnRebindSelection_Click" runat="server"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:DataList runat="server" ID="DataList1" OnItemDataBound="DataList1_ItemDataBound"
                    EnableSelect="true" EnableMultiSelect="true" KeepCurrentSelection="true" DataValueField="Id">
                </f:DataList>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
