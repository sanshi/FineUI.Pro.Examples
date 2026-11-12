<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_summary_multiline_client.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_summary_multiline_client" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-row-summary .f-grid-cell-Major .f-grid-cell-text {
            text-align: right;
        }

        .f-grid-row-summary .f-grid-cell-text {
            font-weight: bold;
        }

        .f-grid-row-summary:first-child .f-grid-cell-text,
        .f-grid-row-summary:nth-child(2) .f-grid-cell-text {
            font-weight: normal;
            font-style: italic;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" Height="450px" PageSize="15" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged"
            EnableSummary="true" SummaryPosition="Bottom" SummaryRowCount="3">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"
                    SummaryRendererFunction="majorSummaryRenderer">
                </f:RenderField>
                <f:RenderField DataField="Fee" FieldType="Int" ColumnID="Fee" HeaderText="学费" SummaryRendererFunction="feeSummaryRenderer" />
                <f:RenderField DataField="ExtraFee" FieldType="Int" ColumnID="ExtraFee" HeaderText="学杂费" SummaryRendererFunction="donateSummaryRenderer" />
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

        function feeSummaryRenderer(summaryRowIndex) {
            var grid1 = this;

            if (summaryRowIndex == 0) {
                return grid1.calcSummaryValue('Fee', 'min');
            } else if (summaryRowIndex == 1) {
                return grid1.calcSummaryValue('Fee', 'max');
            } else if (summaryRowIndex == 2) {
                return grid1.calcSummaryValue('Fee', 'avg', 'N2');
            }
        }

        function donateSummaryRenderer(summaryRowIndex) {
            var grid1 = this;

            if (summaryRowIndex == 0) {
                return grid1.calcSummaryValue('ExtraFee', 'min');
            } else if (summaryRowIndex == 1) {
                return grid1.calcSummaryValue('ExtraFee', 'max');
            } else if (summaryRowIndex == 2) {
                return grid1.calcSummaryValue('ExtraFee', 'avg', 'N2');
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在多行合计中分别显示当前加载记录的最小值、最大值与平均值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照多行统计范围</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>底部各行合计，再切换下一页。<br />结果：三行分别计算最小值、最大值、平均值，统计基于本次加载页，换页后按新页数据更新。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SummaryRowCount</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>3</code>，指定显示的合计行数量，并与各行的统计数据或统计配置对应。
                </li>
                <li><code>SummaryRendererFunction / calcSummaryValue</code>（<strong>合计数据及费用列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：根据合计行序号分别计算
                    min、max、avg，读取当前已加载记录的数值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
