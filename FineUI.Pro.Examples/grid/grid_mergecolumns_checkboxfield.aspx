<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_mergecolumns_checkboxfield.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_mergecolumns_checkboxfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableColumnLines="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业" />
                <f:RenderField ColumnID="GroupB" HeaderText="分组" DataField="GroupB" RendererFunction="renderGroup" />
                <f:RenderCheckField ColumnID="CheckBoxField1" RenderAsStaticField="false" HeaderText="是否激活" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" ClickHandler="onReadCheckStatesClick">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        注：同一分组的复选框只能选中一个。
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <script>
        function onReadCheckStatesClick(event) {
            var grid = F('<%= Grid1.ClientID %>');
            F.customEvent('CheckSelectedRows', {
                rows: getGridCheckRows(grid, ["CheckBoxField1"], true)
            });
            return false;
        }

        function onGridDataLoad(event) {
            this.mergeColumns(['GroupB']);
        }

        var gridClientID = '<%= Grid1.ClientID %>';

        F.ready(function() {
            var grid = F(gridClientID);
            grid.el.on('click', '.f-grid-cell-CheckBoxField1 .f-grid-checkbox', function(event) {
                var checkboxEl = $(this);
                if (!checkboxEl.hasClass('f-checked')) {
                    return;
                }
                var row = checkboxEl.closest('.f-grid-row');
                var group = grid.getRowData(row).values.GroupB;

                // 只取消相邻同组的行，保留其它分组的选择；查询时仍读取各行当前图标。
                function uncheckRow(nextRow) {
                    var data = grid.getRowData(nextRow);
                    if (data.values.GroupB !== group) {
                        return false;
                    }
                    setGridCheckColumns(grid, [data.id], ['CheckBoxField1'], false);
                    return true;
                }

                var nextRow = row.prev();
                while (nextRow.length && uncheckRow(nextRow)) {
                    nextRow = nextRow.prev();
                }
                nextRow = row.next();
                while (nextRow.length && uncheckRow(nextRow)) {
                    nextRow = nextRow.next();
                }
            });
        });

    </script>
</body>
</html>
