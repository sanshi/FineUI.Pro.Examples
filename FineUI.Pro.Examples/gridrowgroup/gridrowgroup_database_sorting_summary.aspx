<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_database_sorting_summary.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_database_sorting_summary" %>

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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Height="500px" Title="表格" runat="server" EnableCollapse="false" PageSize="10" ShowBorder="true"
            ShowHeader="true" EnableCheckBoxSelect="false" AllowPaging="true" IsDatabasePaging="true" OnPageIndexChanged="Grid1_PageIndexChanged"
            AllowSorting="true" SortField="Name" SortDirection="ASC" OnSort="Grid1_Sort" EnableRowGroup="true" DataRowGroupField="EntranceYear"
            RowGroupSummary="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" SortField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
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
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在行分组中按页加载并排序记录，每组显示本页成员的平均值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>排序与换页后重新分组</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong>姓名</strong>等可排序列表头切换排序。<br />结果：排序回发后，后台按字段及升降序重新读取并绑定记录；显示记录继续按<strong>入学年份</strong>分组。</li>
                <li>切换下一页，再返回原页。<br />结果：当前页记录重新取数和分组；同一业务年份可能出现在多个页，每组只包含当前页实际加载成员。各组平均值随本页成员重算，不统计未加载的其他页。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowSorting</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，允许列头发起排序，采用当前字段与方向读取记录。
                </li>
                <li><code>DataRowGroupField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>EntranceYear</code>，按 EntranceYear 生成分组标题，不把组标题当作普通数据行。
                </li>
                <li><code>IsDatabasePaging</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，每次仅提供当前页记录，分组基于该批记录。
                </li>
                <li><code>RowGroupSummary / RowGroupSummaryType</code>（<strong>各组成绩列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：对当前页中各组的成绩求平均；没有加载的记录不参与客户端分组统计。</li>
            </ul>
        </section>
    </template>
</body>
</html>
