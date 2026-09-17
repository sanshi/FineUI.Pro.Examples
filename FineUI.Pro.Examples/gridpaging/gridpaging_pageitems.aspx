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
            AllowPaging="true" IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true" Height="350px"
            EmptyText="没有数据！" ShowPagingMessage="false">
            <Columns>
                <f:RowNumberField />
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
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

    <script src="../res/js/grid.js"></script>
</body>
</html>
