<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_database_beforesorting.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_database_beforesorting" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged" AllowSorting="true" SortField="Name"
            SortDirection="ASC" OnSort="Grid1_Sort">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top" ToolbarAlign="Right">
                    <Items>
                        <f:CheckBox runat="server" ID="cbxEnableSorting" Checked="false" Text="允许排序"></f:CheckBox>
                        <f:CheckBox runat="server" ID="cbxEnablePaging" Checked="false" Text="允许分页"></f:CheckBox>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" SortField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var grid1ClientID = '<%= Grid1.ClientID %>';
        var cbxEnableSortingClientID = '<%= cbxEnableSorting.ClientID %>';
        var cbxEnablePagingClientID = '<%= cbxEnablePaging.ClientID %>';

        F.ready(function() {

            F(grid1ClientID).on('beforesorting', function(event, sortField, sortDirection, columnId) {
                if (!F(cbxEnableSortingClientID).isChecked()) {
                    F.alert('不允许排序！');
                    return false;
                }
            });


            F(grid1ClientID).on('beforepaging', function(event, pageIndex, oldPageIndex) {
                if (!F(cbxEnablePagingClientID).isChecked()) {
                    F.alert('不允许分页！');
                    return false;
                }
            });

        });

    </script>
</body>
</html>
