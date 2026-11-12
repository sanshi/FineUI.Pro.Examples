<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_icons_rowdatabound.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_icons_rowdatabound" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" RowDataBoundFunction="onGrid1RowDataBound">
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

    <script>
        function onGrid1RowDataBound(rowData) {
            var rowId = rowData.id;

            // 默认展开的节点
            if (rowId === '50' || rowId === '60' || rowId === '63' || rowId === '64') {
                rowData.expanded = true;
            }

            var name = rowData.values.Name;
            var lastDotIndex = name.lastIndexOf('.');
            if (lastDotIndex >= 0) {
                var fileType = name.substr(lastDotIndex + 1).toLowerCase();

                if (fileType === 'png' || fileType === 'ico' || fileType === 'gif') {
                    rowData.iconFont = 'f-iconfont-pic';
                } else {
                    rowData.icon = F.resolveUrl('/res/images/filetype/vs-' + fileType + '.png');
                }
            }
        }

    </script>

    <template id="example-description">
        <section aria-label="页面描述">
            <p>按文件类型为树节点指定自定义图标，目录与文件保持各自层级。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看不同类型节点的图标</h3>
            <ul>
                <li>展开<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>一个目录并查看下方文件。<br />结果：文件按<strong>类型</strong>使用相应图标，展开或折叠只改变后代显示，不替换节点业务值。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowData.icon</code>（<strong>行绑定处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>）：按<strong>类型</strong>在行绑定阶段指定节点图标。</li>
            </ul>
        </section>
    </template>
</body>
</html>
