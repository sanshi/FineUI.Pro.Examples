<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="long_precision.aspx.cs" Inherits="FineUI.Pro.Examples.gridother.long_precision" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格（Id 完整）" runat="server" EnableCollapse="false" DataIDField="Id"
            DataTextField="Name">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Id" Width="200px" HeaderText="Id" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别"></f:RenderField>
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField DataField="Major" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业"></f:RenderField>
                <f:RenderField Width="150px" DataField="EntranceDate" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" HeaderText="入学日期">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />

        21956392701267970。
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>对照长整数转为字符串与保留数值两种绑定方式，查看超过 JavaScript 安全整数范围的主键是否完整。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>比较长整数主键</h3>
            <ul>
                <li>对照<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格（Id 完整）">表格（Id 完整）</strong>的首行编号。<br />结果：启用转换时显示完整的长整数；关闭转换时，浏览器数值精度会使末尾数字改变。应把业务主键作为字符串使用。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：Id 在数据库中的实际值是 21956392701267968（17 位，超过 JavaScript 能精确表示的整数范围）。FineUI.Pro 在服务器端渲染表格单元格的值和行标识时统一转为字符串，所以 Id 列原样显示，无需额外配置；而在浏览器端直接书写这个数字，读出来就是
            </p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ConvertLongToString</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格（Id 完整）">表格（Id
                        完整）</strong>）：控制绑定时是否把长整数转换为字符串；关闭的对照表仅用于说明精度风险。</li>
            </ul>
        </section>
    </template>
</body>
</html>
