<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowexpander_grid_rowexpander.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowexpander_grid_rowexpander" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_rowexpander_grid_data.ashx" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" Margin="24px" ShowHeader="true" Title="表格（嵌套表格仅用于数据展示，不适合复杂的逻辑处理）" EnableCollapse="false" runat="server"
            DataIDField="Id">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" TextAlign="Right" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
                <f:RenderField ColumnID="expander" RenderAsRowExpander="true" RendererFunction="renderExpanderContainer" />
            </Columns>
            <Listeners>
                <f:Listener Event="rowexpanderexpand" Handler="onRowExpanderExpand" />
                <f:Listener Event="rowexpandercollapse" Handler="onRowExpanderCollapse" />
            </Listeners>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var grid1 = '<%= Grid1.ClientID %>';

        function getAVGValue(rowData) {
            var total = 0;

            var kemuList = ['yuwen', 'shuxue', 'yingwen', 'wuli', 'huaxue'];
            $.each(kemuList, function(index, item) {
                total += rowData.values[item];
            });

            return Math.round(total / kemuList.length);
        }

        function onRowExpanderExpand(event, rowId) {
            var grid = this,
                rowEl = grid.getRowEl(rowId),
                rowData = grid.getRowData(rowId);

            // v12.0 - 行扩展列重构，.f-grid-rowexpander-details位于.f-grid-row.f-grid-rowexpander节点的下面
            //var tplEl = rowEl.find('.f-grid-rowexpander-details .expander-content');
            var tplEl = rowEl.next().find('.expander-content');
            if (!tplEl.text()) {

                F.create({
                    type: 'Grid',
                    renderTo: tplEl,
                    header: false,
                    columnMenu: false,
                    columnResizing: false,
                    cls: 'gridinrowexpander',
                    fields: ['type', 'yuwen', 'shuxue', 'yingwen', 'wuli', 'huaxue'],
                    columns: [{
                        text: '',
                        field: 'type',
                        width: 80
                    }, {
                        text: '语文',
                        field: 'yuwen',
                        width: 80
                    }, {
                        text: '数学',
                        field: 'shuxue',
                        width: 80
                    }, {
                        text: '英文',
                        field: 'yingwen',
                        width: 80
                    }, {
                        text: '物理',
                        field: 'wuli',
                        width: 80
                    }, {
                        text: '化学',
                        field: 'huaxue',
                        width: 80
                    }, {
                        text: '平均成绩',
                        flex: 1,
                        renderer: function(value, params) {
                            return getAVGValue(params.rowData);
                        }
                    }],
                    rowExpander: {
                        columnType: 'rowexpanderfield',
                        renderer: function(value, params) {
                            var rowData = params.rowData;
                            return rowData.values['type'] + '平均成绩：' + getAVGValue(params.rowData);
                        }
                    },
                    dataUrl: './grid_rowexpander_grid_data.ashx?id=' + rowId + '&name=' + encodeURIComponent(rowData.values[
                        'Name']), // 这里可传递行中任意数据（rowData）
                    listeners: {
                        dataload: function() {
                            rowExpandersDoLayout();
                        }
                    }
                });

            }
        }

        function onRowExpanderCollapse(event, rowId) {
            rowExpandersDoLayout();
        }

        // 重新布局表格和行扩展列中的表格（解决出现纵向滚动条时的布局问题）
        function rowExpandersDoLayout() {
            var grid1Cmp = F(grid1);

            grid1Cmp.doLayout();

            $('.f-grid-row:not(.f-grid-rowexpander-collapsed) .gridinrowexpander').each(function() {
                var gridInside = F($(this).attr('id'));
                gridInside.doLayout();
            });
        }

    </script>
    <script>
        // 为展开后的子表格提供一个空容器，避免把简介内容混入子表格。
        function renderExpanderContainer(value, params) {
            return $('<div>').addClass('expander-content');
        }

    </script>
</body>
</html>
