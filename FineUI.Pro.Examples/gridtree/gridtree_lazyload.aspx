<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_lazyload.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_lazyload" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" OnRowDataBound="Grid1_RowDataBound" OnRowLazyLoad="Grid1_RowLazyLoad">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:RenderField Width="150px" DataField="Type" HeaderText="类型" />
                <f:RenderField Width="150px" DataField="Size" HeaderText="大小" />
                <f:RenderField Width="150px" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>首次展开待加载目录时才请求子节点，不在首屏传输全部后代。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>展开时取得当前分支</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>标记为待加载目录的展开图标。<br />结果：节点展开触发回发，后台根据当前 RowID 返回这个目录的子节点，加载结果归入原父行。</li>
                <li>收起该目录后再展开。<br />结果：已经取得的子节点继续可见，不重复追加相同记录；尚未加载的其他目录仍各自按需读取。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnRowLazyLoad / LoadData</code>（<strong>延迟加载处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：给待加载节点标记 lazy
                    状态，收到父行标识后只提供相应分支数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
