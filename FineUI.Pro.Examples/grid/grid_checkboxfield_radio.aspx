<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_radio.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_checkboxfield_radio" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-field-body-checkboxlabel {
            white-space: nowrap;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false" HeaderText="是否在校1" />
                <f:RenderCheckField ColumnID="CheckBoxField2" RenderAsStaticField="false" HeaderText="是否在校2" DisplayType="Switch" />
                <f:RenderCheckField PreciseClick="true" ColumnID="CheckBoxField3" RenderAsStaticField="false" HeaderText="是否在校3" DisplayType="Radio" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" ClickHandler="onReadCheckStatesClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onReadCheckStatesClick(event) {
            var grid = F('<%= Grid1.ClientID %>');
            F.customEvent('CheckSelectedRows', {
                rows: getGridCheckRows(grid, ["CheckBoxField1", "CheckBoxField2", "CheckBoxField3"], true)
            });
            return false;
        }

        var grid1ClientID = '<%= Grid1.ClientID %>';

        F.ready(function() {
            var grid = F(grid1ClientID);
            grid.el.on('click', '.f-grid-checkboxfield .f-grid-checkbox', function(event) {
                var checkboxEl = $(this);
                if (!checkboxEl.hasClass('f-checked')) {
                    return;
                }
                var columnId = checkboxEl.closest('.f-grid-cell').attr('data-columnid');
                var currentRowId = grid.getRowData(checkboxEl.closest('.f-grid-row')).id;
                var otherRowIDs = grid.getRowEls().map(function() {
                    return grid.getRowData($(this)).id;
                }).get().filter(function(rowId) {
                    return rowId !== currentRowId;
                });
                setGridCheckColumns(grid, otherRowIDs, [columnId], false);
            });
        });

    </script>
</body>
</html>
