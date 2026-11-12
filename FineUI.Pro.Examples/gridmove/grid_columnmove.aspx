<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_columnmove.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_columnmove" %>

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
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <%--<f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />--%>
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="columnmove" Handler="onGridColumnMove" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（保持列顺序）" ClickHandler="onRefreshClick"></f:Button>

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onRefreshClick(event) {
            window.location.reload();
        }


        function onGridColumnMove(event, targetColumnId, sourceColumnId, operation) {
            var grid = this;

            // 列顺序数组
            var columnIds = $.map(grid.columns, function(item, index) {
                return item.columnId;
            });

            // 保存到数据库
            F.customEvent('Grid1_ColumnMove', {
                columnIds: columnIds
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>拖动列标题改变显示顺序，并在刷新后恢复已保存顺序。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>移动列后刷新核对</h3>
            <ol>
                <li>将<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一个允许移动的列标题拖到另一列附近。<br />结果：列头和正文一起采用新顺序，行中的实际字段值仍对应原字段；事件读取最新列清单。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnRefresh").ClientID %>'
                        title="刷新本页面（保持列顺序）">刷新本页面（保持列顺序）</strong>。<br />结果：后台按当前会话保存的配置创建列，顺序恢复。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableColumnMove</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，允许拖动列标题调整位置。
                </li>
                <li><code>columnmove</code>（<strong>页面移动脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：移动后读取列顺序与事件参数；需要恢复锁定时同时保存相应锁定状态。</li>
            </ul>
        </section>
    </template>
</body>
</html>
