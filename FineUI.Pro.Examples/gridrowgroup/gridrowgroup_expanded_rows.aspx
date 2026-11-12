<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridrowgroup_expanded_rows.aspx.cs" Inherits="FineUI.Pro.Examples.gridrowgroup.gridrowgroup_expanded_rows" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" Height="500px" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            DataTextField="Name" EnableRowGroup="true" DataRowGroupField="EntranceYear" RowDataBoundFunction="onGrid1RowDataBound">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script>
        function onGrid1RowDataBound(rowData) {
            var groupValue = rowData.rowGroup;

            if (rowData.isRowGroup) {
                if (groupValue === '2000' || groupValue === '2008') {
                    rowData.expanded = false;
                }
            }
        }

    </script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>首次加载只折叠指定年份分组，其他组继续展开。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>核对初始折叠范围</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的年份<strong>分组</strong>，再点击一个折叠组的展开入口。<br />结果：2000 与 2008 两组初始折叠，其他组展开；单独打开一组不会改变其他组状态。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本表格默认折叠[入学年份]为 2000 和 2008 的两个行分组。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>rowData.expanded</code>（<strong>分组行绑定处理</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：行绑定时对指定<strong>分组</strong>设置
                    false，其他组保留展开。</li>
            </ul>
        </section>
    </template>
</body>
</html>
