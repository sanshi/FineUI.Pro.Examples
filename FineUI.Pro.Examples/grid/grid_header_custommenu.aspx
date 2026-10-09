<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_custommenu.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_header_custommenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

    <style>
        .f-grid-allcolumns-hidden-message {
            display: none !important;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            EnableHeaderMenu="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
            </Columns>
            <Tools>
                <f:Tool runat="server" ID="toolColumns" IconFont="_ColumnsAlt" Text="管理列" ToolTip="显示隐藏列" TabIndex="0" ClickHandler="onToolColumnsClick">
                </f:Tool>
            </Tools>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';
        var toolColumnsClientID = '<%= toolColumns.ClientID %>';

        function onToolColumnsClick(event) {
            var toolEl = this.el; // 当前工具图标元素

            F(Grid1ClientID).showColumnsMenu(toolEl);
        }

        //function createMenuItems() {
        //    var grid1 = F(Grid1ClientID);

        //    var columns = grid1.columns;
        //    var columnsMenuItems = [];
        //    $.each(columns, function (index, column) {
        //        if (column.hideable) {
        //            var menuCheckBox = F.create({
        //                type: 'MenuCheckBox',
        //                text: column.text,
        //                checked: !column.hidden,
        //                handler: function (event) {
        //                    var checked = this.isChecked();
        //                    grid1.hideColumn(event, column, !checked);
        //                }
        //            });
        //            columnsMenuItems.push(menuCheckBox);
        //        }
        //    });

        //    return F.create({
        //        type: 'Menu',
        //        items: columnsMenuItems
        //    });
        //}

        //F.ready(function () {
        //    // 为工具图标设置菜单
        //    F(toolColumnsClientID).setMenu(createMenuItems());
        //});

    </script>
</body>
</html>
