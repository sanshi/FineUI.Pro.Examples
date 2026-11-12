<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_summary_renderer.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_summary_renderer" %>

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

        .f-grid-rowgroup-summary .f-grid-cell.color1 .f-grid-cell-text {
            font-weight: bold;
            color: red;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" RowGroupSummary="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"
                    RowGroupSummaryText="平均（分组）：">
                </f:RenderField>
                <f:RenderField DataField="ChineseScore" FieldType="Int" ColumnID="ChineseScore" HeaderText="语文成绩" RowGroupSummaryType="Avg"
                    RowGroupSummaryRendererFunction="chineseScoreRowGroupSummaryRenderer" />
                <f:RenderField DataField="MathScore" FieldType="Int" ColumnID="MathScore" HeaderText="数学成绩" RowGroupSummaryType="Avg"
                    RowGroupSummaryRendererFunction="mathScoreRowGroupSummaryRenderer" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>

    <script>
        function chineseScoreRowGroupSummaryRenderer(summaryRowIndex, cellValue, params) {

            if (parseInt(cellValue, 10) >= 90) {
                params.cellCls = 'color1';
            }

            return cellValue;
        }

        function mathScoreRowGroupSummaryRenderer(summaryRowIndex, cellValue, params) {

            if (parseInt(cellValue, 10) >= 90) {
                params.cellCls = 'color1';
            }

            return cellValue;
        }

    </script>

    <template id="example-description">
        <section aria-label="页面描述">
            <p>按分组平均成绩为合计单元格设置专用样式。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看成绩条件下的合计样式</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一个年份分组的明细及其后统计区域。<br />结果：达到本页阈值的平均成绩采用强调样式，其他统计保持普通显示；样式不改变计算值。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowGroupSummary</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，为分组创建专用统计行。
                </li>
                <li><code>RowGroupSummaryRendererFunction</code>（<strong>成绩列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：在分组合计单元格中设置本页专用样式；普通明细列不套用该统计显示。</li>
            </ul>
        </section>
    </template>
</body>
</html>
