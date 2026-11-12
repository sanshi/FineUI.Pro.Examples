<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_summary_currentpage_renderer.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_summary_currentpage_renderer" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-row-summary .f-grid-cell.color1 .f-grid-cell-text {
            font-weight: bold;
            color: red;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" Height="350px" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged"
            EnableSummary="true" SummaryPosition="Flow">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField HeaderText="所学专业" ColumnID="Major" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField DataField="Fee" FieldType="Int" ColumnID="Fee" HeaderText="学费" />
                <f:RenderField DataField="ExtraFee" FieldType="Int" ColumnID="ExtraFee" HeaderText="学杂费" SummaryRendererFunction="extraFeeSummaryRenderer" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>

    <script>
        function extraFeeSummaryRenderer(summaryRowIndex, cellValue, params) {

            if (parseInt(cellValue, 10) >= 1500) {
                params.cellCls = 'color1';
            }

            return cellValue;
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>为当前页合计单元格设置专用样式，区分统计结果与普通行的显示。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>样式跟随当前页合计</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>当前页费用单元格与合计行，再切换下一页。<br />结果：合计行采用本页渲染样式，统计按当前页记录重新计算；普通正文不因合计样式改变含义。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SummaryRendererFunction</code>（<strong>费用列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：仅为合计单元格生成专用显示或样式，不代替后台提供当前页统计。</li>
            </ul>
        </section>
    </template>
</body>
</html>
