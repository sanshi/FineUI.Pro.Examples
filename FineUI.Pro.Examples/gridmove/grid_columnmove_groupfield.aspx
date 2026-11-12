<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_columnmove_groupfield.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_columnmove_groupfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            EnableColumnMove="true" EnableSameGroupColumnMove="true">
            <Columns>
                <f:RenderField ColumnID="Year" DataField="Year" HeaderText="统计年份" />
                <f:GroupField ColumnID="anhui" HeaderText="安徽省" TextAlign="Center">
                    <Columns>
                        <f:GroupField ColumnID="hefei" HeaderText="合肥市" TextAlign="Center">
                            <Columns>
                                <f:RenderField ColumnID="AHData1" DataField="AHData1" HeaderText="数据一" />
                                <f:RenderField ColumnID="AHData2" DataField="AHData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:GroupField ColumnID="henan" HeaderText="河南省" TextAlign="Center">
                    <Columns>
                        <f:GroupField ColumnID="zhumadian" HeaderText="驻马店市" TextAlign="Center">
                            <Columns>
                                <f:RenderField ColumnID="HZData1" DataField="HZData1" HeaderText="数据一" />
                                <f:RenderField ColumnID="HZData2" DataField="HZData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                        <f:GroupField ColumnID="luohe" HeaderText="漯河市" TextAlign="Center">
                            <Columns>
                                <f:RenderField ColumnID="HLData1" DataField="HLData1" HeaderText="数据一" />
                                <f:RenderField ColumnID="HLData2" DataField="HLData2" HeaderText="数据二" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:RenderField ColumnID="LogTime" BoxFlex="1" TextAlign="Center" DataField="LogTime" HeaderText="记录时间" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="columnmove" Handler="onGridColumnMove" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
        <f:Button runat="server" ID="btnRefresh" Text="刷新本页面（保持列顺序）" ClickHandler="onRefreshClick"></f:Button>
        <br />
        <br />
    </form>

    <script>
        function onRefreshClick(event) {
            window.location.reload();
        }


        function onGridColumnMove(event, targetColumnId, sourceColumnId, operation) {
            var grid = this;

            function getColumnIds(columns) {
                return $.map(columns, function(item, index) {
                    var itemObj = {
                        columnId: item.columnId
                    };
                    if (item.columns) {
                        itemObj['columns'] = getColumnIds(item.columns);
                    }
                    return itemObj;
                });
            }

            // 列拖拽排序后的列顺序数组
            var columnIds = getColumnIds(grid.columns);

            // 回发，将新的列顺序数组保存到数据库
            F.customEvent('Grid1_ColumnMove', {
                columnIds: columnIds
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在同一分组表头内拖动叶子列，保存组内顺序并保留表头层级。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>调整组内列顺序</h3>
            <ol>
                <li>将<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>一个允许移动的列标题拖到另一列附近。<br />结果：只在允许的同组范围内交换叶子列，父分组标题保留正确跨度；不把它拖入其他分组。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnRefresh").ClientID %>'
                        title="刷新本页面（保持列顺序）">刷新本页面（保持列顺序）</strong>。<br />结果：后台按当前会话保存的配置创建列，顺序恢复。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：表格启用 EnableColumnMove 和 EnableSameGroupColumnMove，确保列只能在同一分组内移动（比如驻马店下面的数据一不能移动到合肥市的下面）！</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EnableColumnMove</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，允许拖动列标题调整位置。
                </li>
                <li><code>EnableSameGroupColumnMove</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，将列移动范围限制在同一分组中。
                </li>
                <li><code>columnmove</code>（<strong>页面移动脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：移动后读取列顺序与事件参数；需要恢复锁定时同时保存相应锁定状态。</li>
            </ul>
        </section>
    </template>
</body>
</html>
