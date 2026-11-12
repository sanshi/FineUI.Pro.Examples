<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_summary_multi.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_summary_multi" %>

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

        .f-grid-row-summary .f-grid-cell-Major .f-grid-cell-text {
            text-align: right;
        }

        .f-grid-row-summary .f-grid-cell-text {
            font-weight: bold;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" EnableSummary="true"
            SummaryPosition="Bottom" SummaryRowCount="3" DataIDField="Id" DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear"
            RowGroupSummary="true" RowGroupSummaryRowCount="3">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"
                    SummaryRendererFunction="majorSummaryRenderer" RowGroupSummaryRendererFunction="majorRowGroupSummaryRenderer">
                </f:RenderField>
                <f:RenderField DataField="ChineseScore" FieldType="Int" ColumnID="ChineseScore" HeaderText="语文成绩"
                    SummaryRendererFunction="chineseScoreSummaryRenderer" RowGroupSummaryRendererFunction="chineseScoreRowGroupSummaryRenderer" />
                <f:RenderField DataField="MathScore" FieldType="Int" ColumnID="MathScore" HeaderText="数学成绩" SummaryRendererFunction="mathScoreSummaryRenderer"
                    RowGroupSummaryRendererFunction="mathScoreRowGroupSummaryRenderer" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function majorSummaryRenderer(summaryRowIndex) {
            if (summaryRowIndex == 0) {
                return "最小值：";
            } else if (summaryRowIndex == 1) {
                return "最大值：";
            } else if (summaryRowIndex == 2) {
                return "平均值：";
            }
        }

        function chineseScoreSummaryRenderer(summaryRowIndex) {
            var grid1 = this,
                result;

            if (summaryRowIndex == 0) {
                result = grid1.calcSummaryValue('ChineseScore', 'min');
            } else if (summaryRowIndex == 1) {
                result = grid1.calcSummaryValue('ChineseScore', 'max');
            } else if (summaryRowIndex == 2) {
                result = grid1.calcSummaryValue('ChineseScore', 'avg');
            }
            return result;
        }

        function mathScoreSummaryRenderer(summaryRowIndex) {
            var grid1 = this,
                result;

            if (summaryRowIndex == 0) {
                result = grid1.calcSummaryValue('MathScore', 'min');
            } else if (summaryRowIndex == 1) {
                result = grid1.calcSummaryValue('MathScore', 'max');
            } else if (summaryRowIndex == 2) {
                result = grid1.calcSummaryValue('MathScore', 'avg');
            }
            return result;
        }






        function majorRowGroupSummaryRenderer(summaryRowIndex) {
            if (summaryRowIndex == 0) {
                return "最小值：";
            } else if (summaryRowIndex == 1) {
                return "最大值：";
            } else if (summaryRowIndex == 2) {
                return "平均值：";
            }
        }

        function chineseScoreRowGroupSummaryRenderer(summaryRowIndex, cellValue, params) {
            var grid1 = this,
                result;

            if (summaryRowIndex == 0) {
                result = grid1.calcSummaryValue('ChineseScore', 'min', params.rowGroupData);
            } else if (summaryRowIndex == 1) {
                result = grid1.calcSummaryValue('ChineseScore', 'max', params.rowGroupData);
            } else if (summaryRowIndex == 2) {
                result = grid1.calcSummaryValue('ChineseScore', 'avg', params.rowGroupData);
            }
            return result;
        }

        function mathScoreRowGroupSummaryRenderer(summaryRowIndex, cellValue, params) {
            var grid1 = this,
                result;

            if (summaryRowIndex == 0) {
                result = grid1.calcSummaryValue('MathScore', 'min', params.rowGroupData);
            } else if (summaryRowIndex == 1) {
                result = grid1.calcSummaryValue('MathScore', 'max', params.rowGroupData);
            } else if (summaryRowIndex == 2) {
                result = grid1.calcSummaryValue('MathScore', 'avg', params.rowGroupData);
            }
            return result;
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>为每组及全表分别显示最小值、最大值和平均值三行统计。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照分组与全表三种统计</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一个年份分组的明细及其后统计区域，再查看表格底部统计。<br />结果：每组有最小、最大、平均三行，底部另有全表三行；两处各自按所属记录计算。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowGroupSummary</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，为分组创建专用统计行。
                </li>
                <li><code>RowGroupSummaryRowCount</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>3</code>，每组提供三行统计。
                </li>
                <li><code>RowGroupSummaryRendererFunction / calcSummaryValue</code>（<strong>成绩列的分组合计渲染函数</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：按统计行序号分别求
                    min、max、avg，传入当前组记录以限定范围。</li>
            </ul>
        </section>
    </template>
</body>
</html>
