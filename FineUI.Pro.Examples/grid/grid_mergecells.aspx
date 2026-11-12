<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_mergecells.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_mergecells" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            EnableColumnLines="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="ID" DataField="Id" HeaderText="ID" />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField Hidden="true" ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业" />
                <f:RenderField ColumnID="Group" HeaderText="分组A" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="GroupB" HeaderText="分组B" DataField="GroupB" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onGridDataLoad(event) {
            this.mergeCells([{
                rowId: '101',
                columnId: 'EntranceYear',
                rowspan: 3
            }, {
                rowId: '102',
                columnId: 'Major',
                rowspan: 3
            }, {
                rowId: '109',
                columnId: 'Group',
                rowspan: 4,
                colspan: 2
            }]);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按起始行、列和跨越范围合并指定单元格，不以字段相同自动推断。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>核对指定的跨行跨列范围</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong><strong>入学年份</strong></strong>、<strong>所学专业</strong>和分组附近的单元格边界。<br />结果：本页指定的起始格跨越多行，分组区域还同时跨列；周围未列入配置的单元格保留原布局，合并只改变显示。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：单元格合并和行扩展列不能同时存在（行扩展列时表格的每一行都是table结构）！</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>mergeCells / rowId / columnId / rowspan / colspan</code>（<strong>页面合并脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：按稳定行标识与列标识指定左上角，rowspan 和
                    colspan 给出跨度；数据加载后重新应用合并范围。</li>
            </ul>
        </section>
    </template>
</body>
</html>
