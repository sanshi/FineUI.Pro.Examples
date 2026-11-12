<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_contextmenu.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_contextmenu" %>

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
            <Listeners>
                <f:Listener Event="beforerowcontextmenu" Handler="onRowContextMenu" />
            </Listeners>
        </f:Grid>
        <f:Menu ID="Menu1" runat="server">
            <Items>
                <f:MenuButton ID="btnExpandRows" runat="server" Text="展开全部" ClickHandler="onExpandRows"></f:MenuButton>
                <f:MenuButton ID="btnCollapseRows" runat="server" Text="折叠全部" ClickHandler="onCollapseRows"></f:MenuButton>
            </Items>
            <Listeners>
                <f:Listener Event="show" Handler="onMenuShow" />
            </Listeners>
        </f:Menu>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        var gridID = '<%= Grid1.ClientID %>';
        var menuID = '<%= Menu1.ClientID %>';
        // 保存当前菜单对应的树节点ID
        var currentRowId;

        // 返回false，来阻止浏览器右键菜单
        function onRowContextMenu(event, rowId) {
            currentRowId = rowId;
            F(menuID).show();
            return false;
        }

        // 设置所有菜单项的禁用状态
        function setMenuItemsDisabled(disabled) {
            var menu = F(menuID);
            $.each(menu.items, function(index, item) {
                item.setDisabled(disabled);
            });
        }

        // 显示菜单后，检查是否禁用菜单项
        function onMenuShow(event) {
            if (currentRowId) {
                var grid = F(gridID);
                var rowData = grid.getRowData(currentRowId);
                if (rowData.leaf) {
                    setMenuItemsDisabled(true);
                } else {
                    setMenuItemsDisabled(false);
                }
            }
        }

        function onExpandRows(event) {
            if (currentRowId) {
                F(gridID).expandRow(currentRowId, true);
            }
        }

        function onCollapseRows(event) {
            if (currentRowId) {
                F(gridID).collapseRow(currentRowId, true);
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>右键节点打开自定义树操作菜单，统一展开或折叠当前树数据。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>使用树节点右键菜单</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong><strong>名称</strong>单元格点击鼠标右键，选择<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnExpandRows").ClientID %>' title="展开全部">展开全部</strong>，再选择<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnCollapseRows").ClientID %>'
                        title="折叠全部">折叠全部</strong>。<br />结果：本页菜单替代默认右键入口；当前树分支按菜单命令统一展开或收起，节点数据不删除。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：在叶子节点上点击右键，则弹出菜单的菜单项都是禁用状态。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowcontextmenu / expandAllTreeNodes / collapseAllTreeNodes</code>（<strong>页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>）：右键处理显示自定义菜单，菜单调用当前表格的树展开与折叠方法。</li>
            </ul>
        </section>
    </template>
</body>
</html>
