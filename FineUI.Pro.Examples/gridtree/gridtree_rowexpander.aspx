<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_rowexpander.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_rowexpander" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" DataAttributeFields="Name,Type">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:RenderField Width="150px" DataField="Type" HeaderText="类型" />
                <f:RenderField Width="150px" DataField="Size" HeaderText="大小" />
                <f:RenderField Width="150px" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
                <f:RenderField ColumnID="expander" RenderAsRowExpander="true" DataField="ModifyDate" RendererFunction="renderFileDetails1"
                    ExpandOnDblClick="false" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
    </form>

    <script>
        function renderFileDetails1(value, params) {
            var fields = params.rowData.attrs;
            return $('<div>').addClass('expander')
                .append($('<p>').append($('<strong>').text('名称：'), document.createTextNode(fields.Name + '（' + fields.Type + '）')))
                .append($('<p>').append($('<strong>').text('修改日期：'), document.createTextNode(value)));
        }

    </script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在树节点行之外显示独立的行详情，区分目录展开与明细展开两个入口。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>分别展开后代与当前行明细</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong><strong>名称</strong>旁的树展开箭头，再点击行扩展列的图标。<br />结果：树箭头显示或隐藏后代行；行扩展图标只在当前行下显示附加资料，两种展开互不代替。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：行扩展列和树表格同时存在时，需要禁用行扩展列的ExpandOnDblClick属性，以避免与树表格的双击展开节点功能冲突。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowExpanderField / TreeColumn</code>（<strong>行扩展列与名称树列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：树列管理父子节点，行扩展列承载这一行的额外展示内容。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
