<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_filter_dynamic_columns.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_filter_dynamic_columns" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/Code/NewFilteredTable.cs" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（动态创建的列）" runat="server" EnableCollapse="false"
            AllowFilters="true" OnFilterChanged="Grid1_FilterChanged">
        </f:Grid>
        <br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid-extra.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在后台动态创建的姓名列中启用过滤，条件变化时重新筛选记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>过滤动态生成的列</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（动态创建的列）">表格（动态创建的列）</strong>的姓名列表头过滤菜单输入<code>张</code>，再点击过滤面板的确定。<br />结果：过滤条件回发，后台按本页匹配规则筛选示例数据并重新绑定，下方同步显示过滤参数。姓名包含张的记录保留。
                </li>
                <li>清除姓名过滤条件并应用。<br />结果：本列不再限制姓名；没有其他条件时重新显示全部学生，下方参数也清除对应条件。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowFilters</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（动态创建的列）">表格（动态创建的列）</strong>）：初始为
                    <code>true</code>，启用表格过滤入口与条件变化处理。
                </li>
                <li><code>EnableFilter</code>（<strong>姓名列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（动态创建的列）">表格（动态创建的列）</strong>）：为该列创建过滤字段；其他未启用过滤的列不额外创建入口。</li>
                <li><code>OnFilterChanged / FilteredData</code>（<strong>表格过滤处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（动态创建的列）">表格（动态创建的列）</strong>）：条件变化后取得完整过滤参数，再由本页代码筛选并重新绑定数据；控件不会自动生成数据库查询。</li>
            </ul>
        </section>
    </template>
</body>
</html>
