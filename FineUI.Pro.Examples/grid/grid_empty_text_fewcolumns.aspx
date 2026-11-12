<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_empty_text_fewcolumns.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_empty_text_fewcolumns" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .grid-empty-text {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 500px;
            margin-left: -250px;
            margin-top: -15px;

            font-size: 24px;
            text-align: center;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" Height="350px" runat="server">
            <Columns>
                <f:RowNumberField Width="60px" ColumnID="Number" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Hidden="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField Hidden="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" Hidden="true" HeaderText="所学专业" Width="200px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" Hidden="true" Width="150px" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField Hidden="true" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
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
            <p>通过绝对定位显示空数据提示，使提示范围不受少量窄列的总宽度限制。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>在有数据与无数据之间切换</h3>
            <ol>
                <li>连续点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="重新绑定表格">重新绑定表格</strong>，对照空数据与有数据两种状态。<br />结果：按钮回发后后台切换数据源；无记录时显示自定义图片与文字，重新绑定记录后提示消失，数据行恢复。提示相对表格可用空间定位，列少时不会被挤在狭窄列宽里。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：初始隐藏了很多列，使得表格的宽度不足以放得下空信息，所以将空信息绝对定位。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>EmptyText</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：指定无记录时显示的自定义内容。</li>
                <li><code>CSS</code>（<strong>空数据提示元素</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：空状态内容使用绝对定位，位置以表格内容区为参照。</li>
            </ul>
        </section>
    </template>
</body>
</html>
