<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_treegrid.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_treegrid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl_treegrid.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true" runat="server"
            DataUrl="~/griddataurl/griddataurl_treegrid.ashx" EnableTree="true" TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId">
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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>从数据网址取得带父子关系的记录，在名称列显示树形层级。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>异步数据到达后展开树</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>目录前的展开箭头。<br />结果：按加载数据的主键与父主键显示后代，其他分支保留当前展开状态。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>~/griddataurl/griddataurl_treegrid.ashx</code>，为树节点提供数据接口。
                </li>
                <li><code>DataParentIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>ParentId</code>，使用父主键关联节点，不只按返回数组位置判断层级。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
