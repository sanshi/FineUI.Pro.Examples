<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_sorting_multi_server.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_sorting_multi_server" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false"
            AllowSorting="true" SortingCancel="true" SortingToolTip="true" SortingMulti="true" SortFieldArray="Gender,ASC"
            runat="server" EnableCheckBoxSelect="true"
            OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="150px" SortField="Name" DataField="Name" DataFormatString="{0}"
                    HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" Width="150px" SortField="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="150px" SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="150px" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
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
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick" MarginRight="5px">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="[入学年份]正序，[姓名]倒序" OnClick="Button2_Click">
        </f:Button>

    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
