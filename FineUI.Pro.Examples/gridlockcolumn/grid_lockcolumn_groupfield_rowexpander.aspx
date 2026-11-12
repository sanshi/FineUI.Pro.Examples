<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn_groupfield_rowexpander.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridlockcolumn.grid_lockcolumn_groupfield_rowexpander" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" Width="1000px" EnableCollapse="false" AllowColumnLocking="true" AllowSorting="true"
            SortField="TotalScore" SortDirection="DESC" Height="400px" runat="server" EnableCheckBoxSelect="true" OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:RenderField EnableLock="true" Locked="true" SortField="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" EnableLock="true" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:GroupField EnableLock="true" Locked="true" HeaderText="考试成绩" TextAlign="Center">
                    <Columns>
                        <f:RenderField EnableLock="true" DataField="ChineseScore" SortField="ChineseScore" HeaderText="语文成绩" TextAlign="Center" />
                        <f:RenderField EnableLock="true" DataField="MathScore" SortField="MathScore" HeaderText="数学成绩" TextAlign="Center" />
                        <f:RenderField EnableLock="true" DataField="TotalScore" SortField="TotalScore" HeaderText="总成绩" TextAlign="Center" />
                    </Columns>
                </f:GroupField>
                <f:RenderField EnableLock="true" SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField EnableLock="true" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField EnableLock="true" Width="800px" SortField="Major" DataField="Major" HeaderText="所学专业" />
                <f:RenderField EnableLock="true" DataField="ShenGao" ColumnID="ShenGao" HeaderText="身高" />
                <f:RenderField EnableLock="true" DataField="TiZhong" ColumnID="TiZhong" HeaderText="体重" />
                <f:RenderField EnableLock="true" DataField="XueYaDi" ColumnID="XueYaDi" HeaderText="血压（低）" />
                <f:RenderField EnableLock="true" DataField="XueYaGao" ColumnID="XueYaGao" HeaderText="血压（高）" />
                <f:RenderField EnableLock="true" DataField="ShiLiZuo" ColumnID="ShiLiZuo" HeaderText="视力（左）" />
                <f:RenderField EnableLock="true" DataField="ShiLiYou" ColumnID="ShiLiYou" HeaderText="视力（右）" />
                <f:RenderField ColumnID="Group" EnableLock="true" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField EnableLock="true" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
                <f:RenderField ColumnID="expander" RenderAsRowExpander="true" DataField="Desc" RendererFunction="renderExpander" />
            </Columns>
        </f:Grid>

        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对分组表头使用左侧列锁定，锁定分组中的列时保持分组结构完整，同时保留行扩展。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>按分组整体锁定</h3>
            <ul>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong>考试成绩</strong>等<strong>分组</strong>的叶子列表头菜单选择锁定，再横向滚动。<br />结果：同组子列一起进入锁定区域，<strong>分组</strong>标题覆盖对应子列；其余非锁定列继续滚动。
                </li>
                <li>点击一行的展开图标。<br />结果：扩展内容在该行下方显示，表头<strong>分组</strong>与锁定关系继续保留。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>GroupField.Columns / Locked</code>（<strong>列锁定配置</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：子列归属于<strong>分组</strong>表头；锁定处理保留<strong>分组</strong>边界，不把一个组头拆成无关标题。</li>
            </ul>
        </section>
    </template>
</body>
</html>
