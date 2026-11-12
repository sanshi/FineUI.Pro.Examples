<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_columnmove_orderwidthhidden.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_columnmove_orderwidthhidden" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableColumnMove="true">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" BoxFlex="1" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="columnmove" Handler="onGridColumnMove" />
                <f:Listener Event="columnresize" Handler="onGridColumnResize" />
                <f:Listener Event="columnhide" Handler="onGridColumnHide" />
                <f:Listener Event="columnshow" Handler="onGridColumnShow" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（保持列顺序+宽度+隐藏）" ClickHandler="onRefreshClick"></f:Button>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onRefreshClick(event) {
            window.location.reload();
        }

        function saveToDB(grid) {
            // 列顺序数组
            var columnIds = $.map(grid.columns, function(item, index) {
                return {
                    'columnId': item.columnId,
                    'hidden': item.hidden,
                    'width': item.width,
                    'flex': item.flex
                };
            });

            // 保存到数据库
            F.customEvent('Grid1_ColumnMove', {
                columnIds: columnIds
            });
        }

        function onGridColumnMove(event, targetColumnId, sourceColumnId, operation) {
            saveToDB(this);
        }

        function onGridColumnResize(event, columnId, newColumnWidth) {
            saveToDB(this);
        }

        function onGridColumnHide(event, columnId) {
            saveToDB(this);
        }

        function onGridColumnShow(event, columnId) {
            saveToDB(this);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>同时保存列拖动后的顺序、列宽与隐藏状态，刷新后恢复整套显示配置。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>移动列后刷新核对</h3>
            <ol>
                <li>将<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一个允许移动的列标题拖到另一列附近。<br />结果：列头和正文一起采用新顺序，行中的实际字段值仍对应原字段；事件读取最新列清单。</li>
                <li>拖动列标题边缘调整宽度，并通过表头菜单隐藏一列。<br />结果：列宽和隐藏状态立即变化，相关事件把这两类配置与当前顺序一起保存。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnRefresh").ClientID %>'
                        title="刷新本页面（保持列顺序+宽度+隐藏）">刷新本页面（保持列顺序+宽度+隐藏）</strong>。<br />结果：后台按当前会话保存的配置创建列，顺序、宽度与显隐恢复。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableColumnMove</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，允许拖动列标题调整位置。
                </li>
                <li><code>columnmove / columnresize / columnhide / columnshow</code>（<strong>页面移动脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：按列标识读取当前顺序、width、flex 与
                    hidden，保存后按同一标识恢复列。</li>
            </ul>
        </section>
    </template>
</body>
</html>
