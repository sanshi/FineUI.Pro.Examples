<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowexpander_grid.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowexpander_grid" %>

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
                        columnId: 'avg',
                        flex: 1,
                        renderer: function(value, params) {
                            var total = 0;

                            var kemuList = ['yuwen', 'shuxue', 'yingwen', 'wuli', 'huaxue'];
                            $.each(kemuList, function(index, item) {
                                total += params.rowData.values[item];
                            });

                            return Math.round(total / kemuList.length);
                        }
                    }],
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

            // 先布局外部表格
            F(grid1).doLayout();

            // 再布局已展开行扩展列的内部表格
            $('.f-grid-rowexpander-details:not(.f-hidden) .gridinrowexpander').each(function() {
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>首次展开一行时按行参数加载成绩，使用内嵌 FineUI 表格显示明细。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>按当前行加载明细</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（嵌套表格仅用于数据展示，不适合复杂的逻辑处理）">表格（嵌套表格仅用于数据展示，不适合复杂的逻辑处理）</strong>首行左侧的展开图标。<br />结果：首次展开时把当前行标识与<strong>姓名</strong>交给数据地址，显示入学、期中、期末成绩及平均成绩；已创建的明细不会因再次展开而重复添加。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowexpanderexpand / dataUrl</code>（<strong>明细加载脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（嵌套表格仅用于数据展示，不适合复杂的逻辑处理）">表格（嵌套表格仅用于数据展示，不适合复杂的逻辑处理）</strong>）：只在尚未创建明细时按行参数加载数据；明细用于展示，不适合复杂嵌套业务编辑。</li>
                <li><code>doLayout</code>（<strong>父表及展开明细</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（嵌套表格仅用于数据展示，不适合复杂的逻辑处理）">表格（嵌套表格仅用于数据展示，不适合复杂的逻辑处理）</strong>）：明细加载或收起后重新计算外层及已展开内容的布局，避免新增滚动条时错位。</li>
            </ul>
        </section>
    </template>
</body>
</html>
