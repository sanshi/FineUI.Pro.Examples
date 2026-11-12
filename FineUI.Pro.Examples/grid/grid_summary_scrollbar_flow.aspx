<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_summary_scrollbar_flow.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_summary_scrollbar_flow" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" Height="350px" Width="900px" PageSize="15" ShowBorder="true"
            ShowHeader="true" AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged"
            EnableSummary="true" SummaryPosition="Flow">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField HeaderText="所学专业" ColumnID="Major" Width="500px" DataField="Major" RendererFunction="renderMajor" />
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
            <p>在双向滚动表格中让合计跟随正文出现在记录末尾。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照滚动与合计位置</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>内部上下滚动，再左右滚动。<br />结果：合计位于记录末尾，需要滚动到末尾查看；横向位置随各列一起变化。</li>
                <li>切换下一页。<br />结果：正文记录切换，合计保持全部数据范围的费用总计。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SummaryPosition</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>Flow</code>，Flow
                    跟随记录，Top 或 Bottom 将合计放在相应固定区域；本页采用上方说明的位置。</li>
                <li><code>Height</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>350px</code>，限定表格视口，让更多记录通过正文内部滚动查看。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
