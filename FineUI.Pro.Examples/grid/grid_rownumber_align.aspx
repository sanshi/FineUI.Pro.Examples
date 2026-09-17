<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rownumber_align.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rownumber_align" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="10" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
            OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" Width="60px" TextAlign="Left" />
                <f:BoundField Width="150px" DataField="Id" HeaderText="ID" />
                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="EntranceTime" HeaderText="时间" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
