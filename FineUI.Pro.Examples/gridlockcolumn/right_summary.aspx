<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="right_summary.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridlockcolumn.right_summary" %>

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
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" Width="1000px" Height="500px" EnableCollapse="false" PageSize="15" ShowBorder="true"
            ShowHeader="true" AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged"
            AllowColumnLocking="true" ColumnLockingRight="true" EnableSummary="true" SummaryPosition="Bottom">
            <Columns>
                <f:RowNumberField />
                <f:RenderField EnableLock="true" Locked="true" ColumnID="name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" EnableLock="true" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField HeaderText="所学专业" EnableLock="true" ColumnID="Major" Width="800px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField EnableLock="true" DataField="ShenGao" ColumnID="ShenGao" HeaderText="身高" />
                <f:RenderField EnableLock="true" DataField="TiZhong" ColumnID="TiZhong" HeaderText="体重" />
                <f:RenderField EnableLock="true" DataField="XueYaDi" ColumnID="XueYaDi" HeaderText="血压（低）" />
                <f:RenderField EnableLock="true" DataField="XueYaGao" ColumnID="XueYaGao" HeaderText="血压（高）" />
                <f:RenderField EnableLock="true" DataField="ShiLiZuo" ColumnID="ShiLiZuo" HeaderText="视力（左）" />
                <f:RenderField EnableLock="true" DataField="ShiLiYou" ColumnID="ShiLiYou" HeaderText="视力（右）" />
                <f:RenderField EnableLock="true" Locked="true" LockedPosition="Right" DataField="Fee" ColumnID="Fee" HeaderText="学费" />
                <f:RenderField EnableLock="true" Locked="true" LockedPosition="Right" DataField="ExtraFee" ColumnID="ExtraFee" HeaderText="学杂费" />
                <f:RenderField ColumnID="Group" EnableLock="true" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField EnableLock="true" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在右侧锁定布局中显示合计行，换页后保持合计与列对齐。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>滚动与换页时核对合计</h3>
            <ol>
                <li>横向滚动<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>，对照表头、正文及合计行。<br />结果：右侧锁定列停留在右侧，已有左侧锁定列也保持固定，普通列与其合计一起滚动；合计值仍位于对应费用列下。</li>
                <li>点击分页栏下一页。<br />结果：后台读取新页记录；本页全量费用合计保持，不把新页局部金额误当成总计。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableSummary</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，显示与锁定列及普通列对应的合计区域。
                </li>
                <li><code>SummaryPosition</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Bottom</code>，按本页位置把合计行固定到表格底部。
                </li>
                <li><code>SummaryData</code>（<strong>表格合计数据</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：后台提供完整示例数据的费用统计；分页只切换正文记录，不缩小统计范围。</li>
            </ul>
        </section>
    </template>
</body>
</html>
