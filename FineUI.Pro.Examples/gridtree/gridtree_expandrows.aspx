<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_expandrows.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_expandrows" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" OnRowDataBound="Grid1_RowDataBound">
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
            <p>只让指定目录在首次加载时展开，其他分支保留折叠状态。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>核对初始展开范围</h3>
            <ul>
                <li>刚打开页面查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>目录与后代，再折叠、重新展开一个目录。<br />结果：basic、res 等指定目录初始展开；用户之后可自行改变某一分支状态。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本树表格默认展开 [basic] 和 [res] 两个目录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TreeNodeExpanded</code>（<strong>行绑定处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：行绑定时按节点标识设置
                    true，只设置本页指定的目录。</li>
            </ul>
        </section>
    </template>
</body>
</html>
