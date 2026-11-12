<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId">
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
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>根据节点主键与父节点主键组成树表格，在名称列展开层级并查看节点资料。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>展开层级并读取当前节点</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>basic 等目录前的展开箭头，再点击一次。<br />结果：对应后代按层级缩进显示，再次点击收起这一分支；其他目录保留原状态。</li>
                <li>选择一个节点行，点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="选中了哪些行">选中了哪些行</strong>。<br />结果：提示当前选择的节点资料；行选择不自动代表选择全部后代。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableTree</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>true</code>，使用树节点方式呈现行。
                </li>
                <li><code>TreeColumn</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>Name</code>，在指定<strong>名称</strong>列中显示层级与展开入口。
                </li>
                <li><code>DataIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>Id</code>，提供每个节点稳定、唯一的标识。
                </li>
                <li><code>DataParentIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：初始为
                    <code>ParentId</code>，读取父节点标识，把子行关联到对应父行。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
