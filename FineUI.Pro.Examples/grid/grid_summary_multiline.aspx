<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_summary_multiline.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_summary_multiline" %>

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

        .f-grid-row-summary:first-child .f-grid-cell-text {
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
            EnableSummary="true" SummaryPosition="Bottom" SummaryRowCount="2">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField HeaderText="所学专业" ColumnID="Major" MinWidth="150px" ExpandUnusedSpace="true" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField DataField="Fee" FieldType="Int" ColumnID="Fee" HeaderText="学费" />
                <f:RenderField DataField="ExtraFee" FieldType="Int" ColumnID="ExtraFee" HeaderText="学杂费" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>用两行合计同时对照当前页费用与全部记录费用。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照多行统计范围</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>底部各行合计，再切换下一页。<br />结果：当前页合计随页记录变化，全部合计保留完整示例记录的总数值，两种统计不混为一行。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SummaryRowCount</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>2</code>，指定显示的合计行数量，并与各行的统计数据或统计配置对应。
                </li>
                <li><code>SummaryDataArray</code>（<strong>合计数据及费用列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：依次提供当前页与完整数据集的费用合计。</li>
            </ul>
        </section>
    </template>
</body>
</html>
