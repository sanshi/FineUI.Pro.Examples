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
                var row = checkboxEl.closest('.f-grid-row');
                var rowData = grid.getRowData(row);
                if (!rowData.values.CheckBoxField1) {
                    return;
                }
                var group = rowData.values.GroupB;

                // 只取消相邻同组的行，保留其它分组的选择；更新后行数据也保存最新状态。
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在相同分组合并区域内实现复选框互斥，其他分组可以保留各自选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>同组合并记录只留一个勾选</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>同一合并<strong>分组</strong>先勾选一行，再勾选该组另一行。<br />结果：新勾选保留，原先同组记录的复选框取消；另一合并组的选择不受影响。</li>
                <li>取消当前勾选，或再切换其他组的复选框。<br />结果：取消不会强制替同组选择另一行；各组状态分别保存，正文与重新绘制后的勾选一致。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：同一分组的复选框只能选中一个。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>mergeColumns</code>（<strong>页面合并脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：只合并用于识别互斥范围的 GroupB 列。</li>
                <li><code>updateCellValue</code>（<strong>页面合并脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：沿相邻同组记录清除其他勾选，同时更新实际行值，避免只改图标导致重绘后恢复旧状态。</li>
            </ul>
        </section>
    </template>
</body>
</html>
