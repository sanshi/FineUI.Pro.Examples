<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_mergecolumns_dependsfirst.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_mergecolumns_dependsfirst" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            EnableColumnLines="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
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
            this.mergeColumns(['Major', 'Group', 'LogTime'], {
                dependsFirst: true
            });
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>后续列只在第一列已经合并的区域内继续合并相同值。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>沿依赖边界核对合并</h3>
            <ul>
                <li>沿<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong><strong><strong>所学专业</strong></strong>、<strong>分组</strong>和<strong>注册日期</strong>等配置列逐行查看合并边界。<br />结果：后续列各自比较相同值，但都不越过第一列合并块；不要求逐级依赖紧邻前一列。
                </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <ul>
                <li>[<strong>分组</strong>]列的单元格合并，依赖于[<strong>所学专业</strong>]列的单元格是否处于合并状态；</li>
                <li>[<strong>注册日期</strong>]列的单元格合并，依赖于[<strong>所学专业</strong>]列的单元格是否处于合并状态。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>mergeColumns / dependsFirst</code>（<strong>页面合并脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：选项 dependsFirst 为
                    true，所有后续列依赖第一列边界。</li>
            </ul>
        </section>
    </template>
</body>
</html>
