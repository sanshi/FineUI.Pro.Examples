<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowmove_multi.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_rowmove_multi" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（可多选）" runat="server" EnableCollapse="false" EnableMultiSelect="true"
            EnableCheckBoxSelect="true" DataIDField="Id">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnMoveUp" Text="选中行上移" CssClass="marginr" ClickHandler="onMoveUpClick"></f:Button>
        <f:Button runat="server" ID="btnMoveDown" Text="选中行下移" CssClass="marginr" ClickHandler="onMoveDownClick"></f:Button>
        <br />
        <br />
        <f:Button CssClass="marginr" runat="server" ID="btnSaveToDB" Text="保存数据" ClickHandler="onSaveToDBClick"></f:Button>
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（请先点击保存按钮）" ClickHandler="onRefreshClick"></f:Button>
        <br />
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onRefreshClick(event) {
            window.location.reload();
        }


        var gridClientID = '<%= Grid1.ClientID %>';

        function onMoveUpClick(event) {
            var grid = F(gridClientID);

            // 向上移动
            grid.moveRowsUp(grid.getSelectedRows());
        }

        function onMoveDownClick(event) {
            var grid = F(gridClientID);

            // 向上移动
            grid.moveRowsDown(grid.getSelectedRows());
        }

        function onSaveToDBClick(event) {
            var grid = F(gridClientID);

            // 列顺序数组
            var rowIds = $.map(grid.data, function(item, index) {
                return item.id;
            });

            // 保存到数据库
            F.customEvent('Grid1_RowMove', {
                rowIds: rowIds
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过上移、下移按钮调整多条选中记录的顺序，并单独保存排列结果。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>批量移动所选行</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（可多选）">表格（可多选）</strong>选择相邻两行，点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnMoveUp").ClientID %>' title="选中行上移">选中行上移</strong>，再点击<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnMoveDown").ClientID %>'
                        title="选中行下移">选中行下移</strong>。<br />结果：选中行作为有序集合移动，彼此相对顺序保留；上下边界不会越过列表范围。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnSaveToDB").ClientID %>'
                        title="保存数据">保存数据</strong>后再刷新。<br />结果：后台保存当前行标识排列，刷新时按保存结果重新绑定；仅点击移动不会自动执行保存。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：请同时选中多行，然后进行操作。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableMultiSelect</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（可多选）">表格（可多选）</strong>）：初始为
                    <code>true</code>，允许同时选择多行，批量移动时保留选中集合的相对顺序。
                </li>
                <li><code>moveRowsUp / moveRowsDown</code>（<strong>页面移动脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（可多选）">表格（可多选）</strong>）：改变实际记录顺序，后续保存提交稳定行标识列表。</li>
            </ul>
        </section>
    </template>
</body>
</html>
