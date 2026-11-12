<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_mergecolumns_lockcolumn.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_mergecolumns_lockcolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableColumnLines="true" AllowColumnLocking="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField Locked="true" ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Locked="true" ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField Width="300px" ColumnID="Major" DataField="Major" HeaderText="所学专业" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
            <Listeners>
                <f:Listener Event="dataload" Handler="onGridDataLoad" />
            </Listeners>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onGridDataLoad(event) {
            this.mergeColumns(['EntranceYear', 'Major']);
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在列锁定布局中合并指定列，横向滚动时保留锁定及合并关系。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>查看相邻相同值的显示</h3>
            <ul>
                <li>沿<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong><strong>所学专业</strong></strong>、<strong>分组</strong>和<strong>注册日期</strong>等配置列逐行查看合并边界，再横向滚动。<br />结果：锁定列位置保持，合并单元格仍覆盖对应相邻行，普通列可以继续横向滚动。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>mergeColumns</code>（<strong>页面合并脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：传入目标列标识数组，合并指定列；数据加载完成后调用。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
