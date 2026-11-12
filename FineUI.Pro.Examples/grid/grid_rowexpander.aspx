<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowexpander.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowexpander" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>


</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" runat="server"
            EnableCheckBoxSelect="false">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" TextAlign="Right" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
                <f:RenderField ColumnID="expander" RenderAsRowExpander="true" DataField="Desc" RendererFunction="renderExpander" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button3" runat="server" Text="显示/隐藏行扩展列" OnClick="Button3_Click">
        </f:Button>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在主行下方展开额外资料，可单独折叠或隐藏整列展开入口。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>展开或收起单行详情</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>首行左侧的展开图标。<br />结果：该行下方出现<strong>姓名</strong>、个人信息等扩展内容；再次点击只收起这一行，不删除记录。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换扩展入口是否显示</h3>
            <ul>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>'
                        title="显示/隐藏行扩展列">显示/隐藏行扩展列</strong>两次。<br />结果：行扩展列先隐藏、再恢复；只调整详情入口显示，不删除主行数据。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：隐藏后仍然可以通过ENTER键展开折叠行扩展列的内容区域。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>RowExpanderField</code>（<strong>行扩展列</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：在记录下方容纳额外展示内容，不改变原数据字段或行标识。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
