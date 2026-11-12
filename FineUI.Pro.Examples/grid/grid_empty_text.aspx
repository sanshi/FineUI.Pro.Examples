<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_empty_text.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_empty_text" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="350px" runat="server">
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
            <p>在数据为空时用自定义内容替代表格行，重新绑定后恢复数据。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>在有数据与无数据之间切换</h3>
            <ol>
                <li>连续点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="重新绑定表格">重新绑定表格</strong>，对照空数据与有数据两种状态。<br />结果：按钮回发后后台切换数据源；无记录时显示自定义图片与文字，重新绑定记录后提示消失，数据行恢复。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：本表格各列宽度固定，所以会出现横向滚动条。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EmptyText</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：指定无记录时显示的自定义内容。</li>
            </ul>
        </section>
    </template>
</body>
</html>
