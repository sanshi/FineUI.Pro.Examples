<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn_savelockedandorder.aspx.cs" Inherits="FineUI.Pro.Examples.gridlockcolumn.grid_lockcolumn_savelockedandorder" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" Width="1000px" runat="server"
            AllowColumnLocking="true" EnableCollapse="false">
            <Columns>
                <f:RowNumberField ColumnID="RowNumber" />
                <f:RenderField ColumnID="Name" EnableLock="true" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" EnableLock="true" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Width="400px" EnableLock="true" HeaderText="所学专业" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField EnableLock="true" DataField="ShenGao" ColumnID="ShenGao" HeaderText="身高" />
                <f:RenderField EnableLock="true" DataField="TiZhong" ColumnID="TiZhong" HeaderText="体重" />
                <f:RenderField EnableLock="true" DataField="XueYaDi" ColumnID="XueYaDi" HeaderText="血压（低）" />
                <f:RenderField EnableLock="true" DataField="XueYaGao" ColumnID="XueYaGao" HeaderText="血压（高）" />
                <f:RenderField EnableLock="true" DataField="ShiLiZuo" ColumnID="ShiLiZuo" HeaderText="视力（左）" />
                <f:RenderField EnableLock="true" DataField="ShiLiYou" ColumnID="ShiLiYou" HeaderText="视力（右）" />
                <f:RenderField ColumnID="Group" EnableLock="true" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" EnableLock="true" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="columnlock" Handler="onGridColumnLock" />
                <f:Listener Event="columnunlock" Handler="onGridColumnUnlock" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（保存列锁定状态和列顺序）" ClickHandler="onRefreshClick"></f:Button>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onRefreshClick(event) {
            window.location.reload();
        }

        function saveToDB(grid) {

            // 列锁定和列顺序
            var configedColumns = $.map(grid.columns, function(column, index) {
                return {
                    ColumnID: column.columnId,
                    Locked: column.locked
                };
            });


            // 保存到数据库
            F.customEvent('Grid1_ColumnLockUnlock', {
                configedColumns: configedColumns
            });
        }


        function onGridColumnLock(event, columnId) {
            saveToDB(this);
        }

        function onGridColumnUnlock(event, columnId) {
            saveToDB(this);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>保存列的锁定状态及当前顺序，当前会话刷新后恢复。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>改变配置后刷新核对</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的表头菜单中锁定或解锁一个允许操作的列。<br />结果：客户端列锁定事件把当前列清单、顺序与锁定配置回发，后台保存到当前会话的示例配置。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnRefresh").ClientID %>'
                        title="刷新本页面（保存列锁定状态和列顺序）">刷新本页面（保存列锁定状态和列顺序）</strong>，或刷新当前示例。<br />结果：后台按已保存配置重建显示，列顺序及锁定状态恢复；本页用会话模拟配置保存，不是已接入业务数据库。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ColumnID / Locked</code>（<strong>列锁定配置</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：保存稳定列标识和锁定状态；恢复时按列标识对应，不按当前显示索引猜测。</li>
                <li><code>columnlock / columnunlock</code>（<strong>页面脚本</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：这些客户端事件触发本页保存处理，列顺序以当前完整列清单保存。</li>
            </ul>
        </section>
    </template>
</body>
</html>
