<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_pagerautosimplemode.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_pagerautosimplemode" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%-- 在 PageManager 级别开启“窄屏自动简洁分页” --%>
        <f:PageManager ID="PageManager1" runat="server" GridPagerAutoSimpleMode="true" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="10" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" ShowPageSizeSelector="true" runat="server"
            OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" Width="60px" />
                <f:BoundField Width="150px" DataField="Id" HeaderText="ID" />
                <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="EntranceTime" HeaderText="时间" />
            </Columns>
        </f:Grid>
        <br />
        <%-- 说明文字放在表格下方 --%>
        <div>
            本页已在 PageManager 级别开启 GridPagerAutoSimpleMode。请缩小浏览器宽度（或在移动端/窄屏查看）：当分页栏放不下时，完整分页器会自动降级为简洁形态（上一页 + 当前/总页 + 下一页）；拉宽后自动还原。
        </div>
    </form>
</body>
</html>
