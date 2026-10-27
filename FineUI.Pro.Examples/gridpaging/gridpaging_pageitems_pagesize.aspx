<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_pageitems_pagesize.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_pageitems_pagesize" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（内存分页）" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" AllowSorting="true" IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true" Height="350px">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" ColumnID="Year" SortField="EntranceYear" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
            <PageItems>
                <f:ToolbarText runat="server" Text="每页记录数：">
                </f:ToolbarText>
                <f:DropDownList runat="server" ID="ddlPageSize" Width="100px" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                    <f:ListItem Text="5" Value="5" />
                    <f:ListItem Text="10" Value="10" />
                    <f:ListItem Text="15" Value="15" />
                    <f:ListItem Text="20" Value="20" />
                </f:DropDownList>
            </PageItems>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
        <strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
        <f:Button CssClass="marginr" ID="btnServerPage" Text="服务端切到第二页" runat="server" OnClick="btnServerPage_Click"></f:Button>
        <f:Button ID="btnServerSort" Text="服务端按入学年份降序并回首页" runat="server" OnClick="btnServerSort_Click"></f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
