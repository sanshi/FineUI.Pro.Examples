<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_pageitems.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_pageitems" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（内存分页）" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true" Height="350px" EmptyText="没有数据！" ShowPagingMessage="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
            <PageItems>
                <f:Button Text="清空数据" runat="server" ID="btnClearData" OnClick="btnClearData_Click">
                </f:Button>
                <f:Button Text="重新绑定数据" runat="server" ID="btnRebind" Icon="Reload" OnClick="btnRebindData_Click">
                </f:Button>
                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                </f:ToolbarSeparator>
                <f:Button Text="选中所有行" runat="server" ID="btnSelectAll" OnClick="btnSelectAll_Click">
                </f:Button>
                <f:Button Text="清空选中行" runat="server" ID="btnClearSelect" OnClick="btnClearSelect_Click">
                </f:Button>
            </PageItems>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
        <strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
