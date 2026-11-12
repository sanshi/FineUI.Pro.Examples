<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridtree_selectall_clientscript.aspx.cs" Inherits="FineUI.Pro.Examples.gridtree.gridtree_selectall_clientscript" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="树表格" runat="server" EnableCollapse="false" EnableTree="true"
            TreeColumn="Name" DataIDField="Id" DataParentIDField="ParentId" OnRowDataBound="Grid1_RowDataBound" EnableCheckBoxSelect="true"
            KeepCurrentSelection="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" ExpandUnusedSpace="true" MinWidth="150px" DataField="Name" HeaderText="名称" />
                <f:RenderField Width="150px" DataField="Type" HeaderText="类型" />
                <f:RenderField Width="150px" DataField="Size" HeaderText="大小" />
                <f:RenderField Width="150px" DataField="ModifyDate" HeaderText="修改日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="rowselect" Handler="onGridRowSelect" />
                <f:Listener Event="rowdeselect" Handler="onGridRowDeselect" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />

    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        // 递归遍历节点 rowData 的所有子节点
        function resolveRowChildren(rowData, callback) {
            var children = rowData.children;
            if (children && children.length) {
                for (var i = 0, count = children.length; i < count; i++) {
                    var item = children[i];
                    callback.apply(item);
                    resolveRowChildren(item, callback);
                }
            }
        }

        function onGridRowSelect(event, rowId) {
            var grid = this,
                rowData = grid.getRowData(rowId);

            var rowIds = [];
            resolveRowChildren(rowData, function() {
                rowIds.push(this.id);
            });

            // 本过程中不触发事件
            F.noEvent(function() {
                // 第二个参数true：保持现有选中项
                grid.selectRows(rowIds, {
                    keep: true
                });
            });
        }

        function onGridRowDeselect(event, rowId) {
            var grid = this,
                rowData = grid.getRowData(rowId);

            var rowIds = [];
            resolveRowChildren(rowData, function() {
                rowIds.push(this.id);
            });

            // 本过程中不触发事件
            F.noEvent(function() {
                // 第二个参数true：保持现有选中项
                grid.deselectRows(rowIds);
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>选择或取消一个父行时，把相同动作应用到其所有下级行。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>让行选择覆盖当前分支</h3>
            <ul>
                <li>选择<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="树表格">树表格</strong>一个父行，再取消这个父行的选择。<br />结果：选中时该分支后代一起选中，取消时一起清除；其他分支的选择保留。这里操作的是整行选择，不是<strong>名称</strong>旁的树复选框。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>本树表格默认展开 [basic] 和 [res] 两个目录</li>
                <li>注意表格属性：EnableCheckBoxSelect="true" KeepCurrentSelection="true"</li>
                <li>表格客户端函数 selectRows 的第二个参数，用来指示是否保持现有选中项</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowselect / rowdeselect / selectRows / deselectRows</code>（<strong>页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="树表格">树表格</strong>）：递归取得当前行
                    children，批量更新后代选择；使用 F.noEvent 避免递归触发同类事件。</li>
            </ul>
        </section>
    </template>
</body>
</html>
