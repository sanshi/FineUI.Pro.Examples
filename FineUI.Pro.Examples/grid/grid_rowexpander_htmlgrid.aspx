<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowexpander_htmlgrid.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowexpander_htmlgrid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_rowexpander_grid_data.ashx" />
    <style>
        .mytable {
            border-width: 1px;
            border-style: solid;
            border-collapse: separate;
            border-spacing: 0;
            border-bottom-width: 0;
            border-right-width: 0;
        }

        .mytable th,
        .mytable td {
            padding: 5px;
            text-align: left;
            border-bottom-width: 1px;
            border-bottom-style: solid;
            border-right-width: 1px;
            border-right-style: solid;
            width: 100px;
        }

    </style>

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

                var dataUrl = './grid_rowexpander_grid_data.ashx?id=' + rowId + '&name=' + encodeURIComponent(rowData.values['Name']); // 这里可传递行中任意数据（rowData）

                // 直接调用 jQuery 的 ajax 函数
                $.ajax({
                    dataType: 'json',
                    cache: false,
                    url: dataUrl,
                    method: 'GET',
                    success: function(data) {
                        // data: [["入学",62,72,47,55,55],["期中",69,71,70,45,53],["期末",40,55,64,64,79]]
                        var html = [];
                        html.push(
                            '<table class="mytable f-widget-header"><tr><th class="f-widget-header"></th><th class="f-widget-header">语文</th><th class="f-widget-header">数学</th><th class="f-widget-header">英文</th><th class="f-widget-header">物理</th><th class="f-widget-header">化学</th><th class="f-widget-header">平均成绩</th></tr>'
                        );

                        for (var i = 0, count = data.length; i < count; i++) {
                            var item = data[i];

                            html.push('<tr>');

                            var totalScore = 0;

                            html.push('<td class="f-widget-content">' + item[0] + '</td>');

                            totalScore += item[1];
                            html.push('<td class="f-widget-content">' + item[1] + '</td>');

                            totalScore += item[2];
                            html.push('<td class="f-widget-content">' + item[2] + '</td>');

                            totalScore += item[3];
                            html.push('<td class="f-widget-content">' + item[3] + '</td>');

                            totalScore += item[4];
                            html.push('<td class="f-widget-content">' + item[4] + '</td>');

                            totalScore += item[5];
                            html.push('<td class="f-widget-content">' + item[5] + '</td>');

                            var avgScore = Math.round(totalScore / 5);
                            html.push('<td class="f-widget-content">' + avgScore + '</td>');

                            html.push('</tr>');
                        }

                        html.push('</table>');

                        tplEl.html(html.join(''));

                        rowExpandersDoLayout();
                    }
                });

            }
        }

        function onRowExpanderCollapse(event, rowId) {
            rowExpandersDoLayout();
        }

        // 重新布局表格（解决出现纵向滚动条时的布局问题）
        function rowExpandersDoLayout() {
            var grid1Cmp = F(grid1);
            grid1Cmp.doLayout();
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
