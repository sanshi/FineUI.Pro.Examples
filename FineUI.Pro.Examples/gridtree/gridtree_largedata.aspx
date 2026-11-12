<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_largedata.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_largedata" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格（3500个节点）" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId">
            <Columns>
                <f:RowNumberField EnableTreeNumber="true" Width="80px" />
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
            <p>为大量树节点显示树序号，展开折叠时保持节点的绝对次序编号。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>对照展开前后的编号</h3>
            <ol>
                <li>记下<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格（3500个节点）">树表格（3500个节点）</strong>一个目录及其后面节点的序号，展开再折叠该目录。<br />结果：后代按树数据中的位置显示编号，折叠只隐藏后代，不把后续节点重新压成连续可见行号。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableTreeNumber</code>（<strong>序号列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格（3500个节点）">树表格（3500个节点）</strong>）：序号列按整棵树的次序编号，包含当前折叠的后代。</li>
            </ul>
        </section>
    </template>
</body>
</html>
