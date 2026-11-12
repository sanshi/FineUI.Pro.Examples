<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_summary_total.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowgrouprowgroup.gridrowgroup_summary_total" %>

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
            SummaryPosition="Bottom" DataIDField="Id" DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" RowGroupSummary="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"
                    SummaryText="平均（汇总）：" RowGroupSummaryText="平均（分组）：">
                </f:RenderField>
                <f:RenderField DataField="ChineseScore" FieldType="Int" ColumnID="ChineseScore" HeaderText="语文成绩" SummaryType="Avg" RowGroupSummaryType="Avg" />
                <f:RenderField DataField="MathScore" FieldType="Int" ColumnID="MathScore" HeaderText="数学成绩" SummaryType="Avg" RowGroupSummaryType="Avg" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>同时显示每组平均成绩和全表平均成绩，明确两个统计范围。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照分组明细与统计值</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一个年份分组的明细及其后统计区域，再查看表格底部统计。<br />结果：组内统计只使用该年份成员；底部平均（汇总）按全表记录计算，不是把各组平均值直接再平均。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowGroupSummary</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，为分组创建专用统计行。
                </li>
                <li><code>RowGroupSummaryType</code>（<strong>语文与数学成绩列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：成绩列使用 Avg，只读取当前组的数值。</li>
                <li><code>EnableSummary</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，在各组统计以外显示全表汇总行。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
