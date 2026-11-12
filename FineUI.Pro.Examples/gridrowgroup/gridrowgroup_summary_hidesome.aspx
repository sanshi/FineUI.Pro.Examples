<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_summary_hidesome.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_summary_hidesome" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-rowgroup-summary .f-grid-cell-Major .f-grid-cell-text {
            text-align: right;
        }

        .f-grid-rowgroup-summary .f-grid-cell-text {
            font-style: italic;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" RowGroupSummary="true" RowRendererFunction="grid1RowRenderer">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"
                    RowGroupSummaryText="平均（分组）：">
                </f:RenderField>
                <f:RenderField DataField="ChineseScore" FieldType="Int" ColumnID="ChineseScore" HeaderText="语文成绩" RowGroupSummaryType="Avg" />
                <f:RenderField DataField="MathScore" FieldType="Int" ColumnID="MathScore" HeaderText="数学成绩" RowGroupSummaryType="Avg" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>

        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>

    <script>
        var Grid1ClientID = '<%= Grid1.ClientID %>';

        // 计算分组中的行数（排除分组合计）
        function linesInRowGroup(rowGroup) {
            var lines = 0;
            $.each(F(Grid1ClientID).data, function(index, rowData) {
                if (rowData.isRowGroup && rowData.rowGroup === rowGroup) {
                    // 最后一行是分组合计
                    lines = rowData.children.length - 1;
                    return false; // break
                }
            });
            return lines;
        }

        // 在 RowRenderer 中改变行CSS类
        function grid1RowRenderer(params) {
            // 当前行是否分组合计
            var isRowGroupSummary = params.rowData.isRowGroupSummary;
            if (isRowGroupSummary) {
                var rowGroup = params.rowData.rowGroup;

                // 如果分组中只有一行数组，则隐藏分组合计
                if (linesInRowGroup(rowGroup) === 1) {
                    params.rowCls = 'f-hidden';
                }
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>只为包含多条明细的分组显示合计，省去单行分组的重复统计。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>区分单行组与多行组</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一个年份分组的明细及其后统计区域。<br />结果：只有一条明细的组不再显示合计行，多条明细组仍显示平均成绩；数据行本身没有删除。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：如果分组中只有一行数据，则隐藏分组合计。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowGroupSummary</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，为分组创建专用统计行。
                </li>
                <li><code>RowRendererFunction / rowCls</code>（<strong>分组合计行渲染函数</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：统计行渲染时检查当前组明细数量，单行组添加
                    f-hidden 样式。</li>
            </ul>
        </section>
    </template>
</body>
</html>
