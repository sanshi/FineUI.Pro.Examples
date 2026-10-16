<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grideditor_dynamic.aspx.cs"
    Inherits="FineUI.Pro.Examples.grideditor.grideditor_dynamic" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="false" runat="server"
            AllowCellEditing="true" ClicksToEdit="1" OnRowDataBound="Grid1_RowDataBound">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="收费项目" ExpandUnusedSpace="true" MinWidth="150px" />
            </Columns>
            <Listeners>
                <f:Listener Event="afteredit" Handler="onGridAfterEdit" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>列[2014年]到[2017年]是在后台动态创建的</li>
            <li>修改第一列的值，会同时更新后面几列的值</li>
        </ul>
    </form>
    <script type="application/json" id="yearRange"><%= YearRangeJson %></script>
    <script>
        var yearRange = JSON.parse(document.getElementById('yearRange').textContent);
        window._MINYEAR = yearRange.minYear;
        window._MAXYEAR = yearRange.maxYear;

        function updateTotalCell(grid, rowId) {
            var me = grid,
                total = 0;
            for (var i = _MINYEAR; i <= _MAXYEAR; i++) {
                total += me.getCellValue(rowId, 'Year_' + i);
            }

            // 对象中的键是列 ID，可用同一种写法更新一个或多个单元格。
            // API：https://fineui.com/js/api/FineUI.Grid.html#updateCellValue
            me.updateCellValue(rowId, {
                TotalFee: total
            });
        }

        function onGridAfterEdit(event, value, params) {
            var me = this,
                rowId = params.rowId;
            if (params.columnId === 'Year_' + _MINYEAR) {
                for (var i = _MINYEAR + 1; i <= _MAXYEAR; i++) {
                    me.updateCellValue(rowId, {
                        ['Year_' + i]: value
                    });
                }
            }

            updateTotalCell(me, rowId);
        }

    </script>
</body>
</html>
