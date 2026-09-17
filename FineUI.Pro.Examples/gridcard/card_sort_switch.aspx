<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card_sort_switch.aspx.cs" Inherits="FineUI.Pro.Examples.gridcard.card_sort_switch" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/js/gridcard.js" />
    <style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            DataIDField="Id" Height="500px" DisplayType="Card" CardRendererFunction="renderCard"
            AllowSorting="true" SortField="Gender" SortDirection="ASC" OnSort="Grid1_Sort">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:ToolbarFill runat="server"></f:ToolbarFill>
                        <f:Button IconFont="_Sort" ID="btnSort" ShowMenuIcon="false" runat="server">
                            <Menu runat="server">
                                <Items>
                                    <f:MenuCheckBox Text="姓名" AttributeDataTag="Name" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="性别" AttributeDataTag="Gender" Checked="true" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="入学年份" AttributeDataTag="EntranceYear" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="入学日期" AttributeDataTag="EntranceDate" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="是否在校" AttributeDataTag="AtSchool" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="所学专业" AttributeDataTag="Major" GroupName="MenuColumnName" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuSeparator runat="server"></f:MenuSeparator>
                                    <f:MenuCheckBox Text="升序" AttributeDataTag="ASC" Checked="true" IconFont="_Ascend" GroupName="MenuSortDirection" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                    <f:MenuCheckBox Text="降序" AttributeDataTag="DESC" IconFont="_Descend" GroupName="MenuSortDirection" AutoPostBack="false" runat="server">
                                    </f:MenuCheckBox>
                                </Items>
                                <Listeners>
                                    <f:Listener Event="checkchange" Handler="onSortMenuCheckChange" />
                                </Listeners>
                            </Menu>
                        </f:Button>
                        <f:Button IconFont="_Gallery" ID="btnDisplayType" runat="server" ClickHandler="onDisplayTypeClick"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" SortField="Name" HeaderText="姓名"></f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" SortField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别"></f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" SortField="EntranceYear" FieldType="Int" HeaderText="入学年份"></f:RenderField>
                <f:RenderField Width="150px" ColumnID="EntranceDate" DataField="EntranceDate" SortField="EntranceDate" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy/MM/dd" HeaderText="入学日期">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" SortField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校"></f:RenderCheckField>
                <f:RenderField ColumnID="Major" DataField="Major" SortField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="sorting" Handler="onGrid1Sorting" />
            </Listeners>
        </f:Grid>
    </form>
    <script src="../res/js/gridcard.js"></script>
    <script>

        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var btnDisplayTypeClientID = '<%= btnDisplayType.ClientID %>';
        var btnSortClientID = '<%= btnSort.ClientID %>';

        // https://fineui.com/js/api/F.Grid.html#event:sorting
        // 表格模式下点击列标题栏排序时，同步更新下拉菜单
        function onGrid1Sorting(event, sortField, sortDirection) {
            var menu = F(btnSortClientID).menu;

            $.each(menu.items, function (index, item) {
                if (item.group === 'MenuColumnName' && item.getAttr('data-tag') === sortField) {
                    item.setChecked(true);
                } else if (item.group === 'MenuSortDirection' && item.getAttr('data-tag') === sortDirection) {
                    item.setChecked(true);
                }
            });
        }

        function onDisplayTypeClick(event) {
            var btn = this;
            if (btn.iconFont.indexOf('gallery') >= 0) {
                btn.setIconFont('f-iconfont-table');

                F(Grid1ClientID).setDisplayType('default');
            } else {
                btn.setIconFont('f-iconfont-gallery');

                F(Grid1ClientID).setDisplayType('card');
            }
        }

        // https://fineui.com/js/api/F.Menu.html#event:checkchange
        function onSortMenuCheckChange(event, item, checked) {
            var menu = F(btnSortClientID).menu;
            var grid = F(Grid1ClientID);

            var sortFieldMenuItem = menu.getCheckedItem('MenuColumnName');
            var sortDirectionMenuItem = menu.getCheckedItem('MenuSortDirection');

            var sortField = sortFieldMenuItem.getAttr('data-tag');
            var sortDirection = sortDirectionMenuItem.getAttr('data-tag');

            // 更新表格的排序状态
            grid.setSortField(sortField, sortDirection);
            // 触发表格的排序行为（触发表格默认的排序回发事件）
            grid.trigger('sorting', [event, sortField, sortDirection]);
        }

    </script>
</body>
</html>
