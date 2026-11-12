<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_filter.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_filter" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/Code/NewFilteredTable.cs" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            AllowFilters="true" OnFilterChanged="Grid1_FilterChanged">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" EnableFilter="true" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />

        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用姓名列表头过滤入口输入条件，提交后显示匹配学生与过滤参数。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>按姓名过滤并清除</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>姓名</strong>列表头过滤菜单输入<code>张</code>，再点击过滤面板的确定。<br />结果：过滤条件回发，后台按本页匹配规则筛选示例数据并重新绑定，下方同步显示过滤参数。<strong>姓名</strong>包含张的记录保留。
                </li>
                <li>清除<strong>姓名</strong>过滤条件并应用。<br />结果：本列不再限制<strong>姓名</strong>；没有其他条件时重新显示全部学生，下方参数也清除对应条件。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowFilters</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，启用表格过滤入口与条件变化处理。
                </li>
                <li><code>EnableFilter</code>（<strong>姓名列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：为该列创建过滤字段；其他未启用过滤的列不额外创建入口。
                </li>
                <li><code>OnFilterChanged / FilteredData</code>（<strong>表格过滤处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：条件变化后取得完整过滤参数，再由本页代码筛选并重新绑定数据；控件不会自动生成数据库查询。</li>
            </ul>
        </section>
    </template>
</body>
</html>
