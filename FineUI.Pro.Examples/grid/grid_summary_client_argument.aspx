<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_summary_client_argument.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_summary_client_argument" %>

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

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" Height="450px" PageSize="14" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged"
            EnableSummary="true" SummaryPosition="Bottom">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"
                    SummaryText="平均值：">
                </f:RenderField>
                <f:RenderField DataField="Fee" FieldType="Float" ColumnID="Fee" HeaderText="学费" SummaryType="Avg" SummaryTypeArgument="N2" />
                <f:RenderField DataField="GPA" FieldType="Float" ColumnID="GPA" HeaderText="GPA" SummaryType="Avg" SummaryTypeArgument="F3" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>浏览器计算当前页各数值列的平均值，并按指定数字格式显示结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>当前数据改变后重新统计</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>学费</strong>与<strong>GPA</strong>统计，再点击下一页。<br />结果：浏览器对当前加载记录计算各列平均值，新页加载后重新计算，不包含未加载的其他页。N2
                    显示两位小数并使用分组符号，F3 显示三位固定小数。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SummaryType</code>（<strong>学费与GPA列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：统计列采用 Avg，从当前页数值计算平均值。</li>
                <li><code>SummaryTypeArgument</code>（<strong>学费与GPA列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：分别采用 N2、F3
                    对计算后的平均值格式化，格式只影响显示，不改变统计范围。</li>
            </ul>
        </section>
    </template>
</body>
</html>
