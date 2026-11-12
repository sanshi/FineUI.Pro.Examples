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

    </form>
    <script type="application/json" id="yearRange">
        <%= YearRangeJson %>

    </script>
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按年份动态创建费用编辑列，首年修改可同步后续年份，并计算同一行合计。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>动态年份列联动计算</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>把最早年份费用改为<code>100</code>并结束编辑。<br />结果：后续年份费用同步为 100，合计重新按各年当前费用求和。</li>
                <li>单独修改后面某一年的费用，再点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="保存数据">保存数据</strong>。<br />结果：只更新该年及同一行合计；后台把各年费用写回示例数据，重新绑定后动态列继续正确显示。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>列[2014年]到[2017年]是在后台动态创建的</li>
                <li>修改第一列的值，会同时更新后面几列的值</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Columns / RowDataBoundFunction</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（单击编辑）">表格（单击编辑）</strong>）：创建年份列，再在行绑定时将
                    YearData 展开为各年份的列值。</li>
                <li><code>afteredit / updateCellValue</code>（<strong>页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（单击编辑）">表格（单击编辑）</strong>）：修改最早年份时同步后续年份；任一费用变化后重算当前行的 TotalFee。</li>
            </ul>
        </section>
    </template>
</body>
</html>
