<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_paging_summary.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_paging_summary" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl_paging_summary.ashx" />
    <style>
        .f-grid-row-summary .f-grid-cell-text {
            font-weight: bold;
            color: red;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="350px" EnableCheckBoxSelect="true"
            runat="server" DataIDField="Id" DataUrl="~/griddataurl/griddataurl_paging_summary.ashx" AllowPaging="true" IsDatabasePaging="false" PageSize="5"
            EnableSummary="true" SummaryPosition="Bottom">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Fee" DataField="Fee" HeaderText="学费">
                </f:RenderField>
                <f:RenderField ColumnID="ExtraFee" DataField="ExtraFee" HeaderText="学杂费">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>从网址加载完整记录，同时显示全部记录费用合计。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>翻页时核对统计范围</h3>
            <ol>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>费用合计，再点击下一页。<br />结果：浏览器对已经取得的完整数据分页。合计保留全部记录范围，不缩小为新页数据之和。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>IsDatabasePaging</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>false</code>，加载完整数据，换页由浏览器完成。
                </li>
                <li><code>summaryData</code>（<strong>合计数据与费用列</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：数据接口提供完整统计，正文分页与合计范围分别处理。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
