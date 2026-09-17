<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datalist.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.datalist.datalist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
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
                <f:DataList runat="server" ID="DataList1">
                    <f:DataListItem Text="列表项1" />
                    <f:DataListItem Text="列表项2" />
                    <f:DataListItem Text="列表项3" />
                    <f:DataListItem Text="列表项4" />
                    <f:DataListItem Text="列表项5" />
                    <f:DataListItem Text="列表项6" />
                    <f:DataListItem Text="列表项7" />
                    <f:DataListItem Text="列表项8" />
                    <f:DataListItem Text="一个很长很长很长很长很长很长很长很长很长很长很长很长很长很的列表项" />
                </f:DataList>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
