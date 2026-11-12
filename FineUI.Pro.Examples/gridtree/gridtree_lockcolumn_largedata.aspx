<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_lockcolumn_largedata.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_lockcolumn_largedata" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格（3500个节点）" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" AllowColumnLocking="true">
            <Columns>
                <f:RowNumberField EnableTreeNumber="false" Width="80px" />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" EnableLock="true" Locked="true"
                    Width="300px" />
                <f:RenderField Width="150px" DataField="Type" HeaderText="类型" EnableLock="true" />
                <f:RenderField Width="150px" DataField="Size" HeaderText="大小" EnableLock="true" />
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
            <p>在大量节点的树表格中固定指定列，横向滚动时仍可看到层级定位信息。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>滚动时保留锁定列</h3>
            <ul>
                <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格（3500个节点）">树表格（3500个节点）</strong>目录，再横向滚动。<br />结果：左侧锁定区域保持可见，普通列随滚动移动，节点的父子关系与当前展开状态保留。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowColumnLocking</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格（3500个节点）">树表格（3500个节点）</strong>）：初始为
                    <code>true</code>，为树表格启用列锁定。
                </li>
                <li><code>Locked</code>（<strong>已锁定列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格（3500个节点）">树表格（3500个节点）</strong>）：本页指定列初始进入锁定区域，不影响其树节点数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
