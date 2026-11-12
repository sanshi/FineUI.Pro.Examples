<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_empty_icon_text.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_empty_icon_text" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="350px"
            ShowEmptyIconText="true" runat="server">
            <Columns>
                <f:RowNumberField Width="60px" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" Width="200px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" Width="150px" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在无数据时显示表格内置的图标与提示文字，重新绑定后恢复数据行。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>在有数据与无数据之间切换</h3>
            <ol>
                <li>连续点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="重新绑定表格">重新绑定表格</strong>，对照空数据与有数据两种状态。<br />结果：按钮回发后后台切换数据源；无记录时显示内置图标与空数据文案，重新绑定记录后提示消失，数据行恢复。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：默认（不设置 EmptyText、ShowEmptyIconText 为 false）表格为空时显示空白；本例通过 ShowEmptyIconText=&quot;true&quot; 开启内置的「图标 + 文案」空状态。也可在 PageManager 上设置
                GridShowEmptyIconText=&quot;true&quot;</p>
            <p>注：默认（不设置 EmptyText、ShowEmptyIconText 为 false）表格为空时显示空白；本例通过 ShowEmptyIconText=&quot;true&quot; 开启内置的「图标 + 文案」空状态。也可在 PageManager 上设置
                GridShowEmptyIconText=&quot;true&quot; 全局开启。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ShowEmptyIconText</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，开启无数据时的内置图标和文字。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
