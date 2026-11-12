<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_treegrid_lazyload.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_treegrid_lazyload" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl_treegrid_lazyload.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true" runat="server"
            DataUrl="~/griddataurl/griddataurl_treegrid_lazyload.ashx" EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId"
            RowDataBoundFunction="gridRowDataBound">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Type" DataField="Type" HeaderText="类型">
                </f:RenderField>
                <f:RenderField ColumnID="Size" DataField="Size" HeaderText="大小">
                </f:RenderField>
                <f:RenderField Width="150px" ColumnID="ModifyDate" DataField="ModifyDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd"
                    HeaderText="修改日期">
                </f:RenderField>
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        // 自定义客户端行数据绑定函数
        function gridRowDataBound(rowData) {

            // 显式设置类型[文件夹]为非叶子节点（展开时延迟加载）
            // 如果不如此设置，则没有子节点的节点都被默认作为叶子节点
            if (rowData.values['Type'] === '文件夹') {
                rowData.leaf = false;
            }

        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按数据网址逐级加载树分支，首次只取得顶层节点。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>展开目录时请求该分支</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>目录前的展开箭头。<br />结果：请求带上当前父节点标识，接口只返回这个目录的子项并追加到原父行；不是每次展开都重新绑定整棵树。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>~/griddataurl/griddataurl_treegrid_lazyload.ashx</code>，为树节点提供数据接口。
                </li>
                <li><code>DataParentIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>ParentId</code>，使用父主键关联节点，不只按返回数组位置判断层级。
                </li>
                <li><code>rowData.leaf</code>（<strong>树节点行绑定处理</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：行绑定把可延迟展开的文件夹指定为
                    false；没有子项的当前返回节点也不会被误认成永久叶子。</li>
            </ul>
        </section>
    </template>
</body>
</html>
