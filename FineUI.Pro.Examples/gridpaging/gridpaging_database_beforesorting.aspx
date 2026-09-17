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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
            OnPageIndexChanged="Grid1_PageIndexChanged"
            AllowSorting="true" SortField="Name" SortDirection="ASC"
            OnSort="Grid1_Sort">
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
                <f:BoundField DataField="Name" SortField="Name" DataFormatString="{0}"
                    HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" SortField="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="../res/js/grid.js"></script>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';
        var cbxEnableSortingClientID = '<%= cbxEnableSorting.ClientID %>';
        var cbxEnablePagingClientID = '<%= cbxEnablePaging.ClientID %>';

        F.ready(function () {

            F(grid1ClientID).on('beforesorting', function (event, sortField, sortDirection, columnId) {
                if (!F(cbxEnableSortingClientID).isChecked()) {
                    F.alert('不允许排序！');
                    return false;
                }
            });


            F(grid1ClientID).on('beforepaging', function (event, pageIndex, oldPageIndex) {
                if (!F(cbxEnablePagingClientID).isChecked()) {
                    F.alert('不允许分页！');
                    return false;
                }
            });

        });

    </script>
</body>
</html>
