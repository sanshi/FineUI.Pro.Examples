<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_hide.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_header_hide" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="false" Title="表格" Height="200px" runat="server" EnableCollapse="false"
            ShowGridHeader="false" EnableRowLines="false" EnableAlternateRowColor="false">
            <Columns>
                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
            </Columns>
        </f:Grid>
        <br />
        注：本表格隐藏了表头、行分隔线、间隔行背景色。
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
