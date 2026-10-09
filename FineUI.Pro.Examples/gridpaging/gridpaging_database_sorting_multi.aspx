<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_database_sorting_multi.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_database_sorting_multi" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged" AllowSorting="true"
            SortingCancel="true" SortingToolTip="true" SortingMulti="true" SortFieldArray="Gender,ASC" OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:RenderField Width="150px" DataField="Name" SortField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" Width="150px" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="150px" SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Width="150px" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
            <Toolbars>
                <f:Toolbar Position="Top" runat="server">
                    <Items>
                        <f:Label ID="labSortOrderTip" runat="server"></f:Label>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
