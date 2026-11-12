<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_changetextwidth.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_header_changetextwidth" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true"
            IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField Width="150px" ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" CssClass="marginr" runat="server" Text="修改[入学年份]的标题文本和宽度" OnClick="Button1_Click">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="还原[入学年份]" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过页面脚本修改入学年份列的标题和宽度，再恢复原配置。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>修改并还原列标题与宽度</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>'
                        title="修改[入学年份]的标题文本和宽度">修改[入学年份]的标题文本和宽度</strong>。<br />结果：本页脚本把<strong><strong>入学年份</strong></strong>改为<strong><strong>入学年份</strong></strong>（已修改），宽度改为
                    200；按钮回发后，后台通知浏览器执行列修改函数。</li>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>'
                        title="还原[入学年份]">还原[入学年份]</strong>。<br />结果：标题恢复<strong>入学年份</strong>，宽度恢复 120，数据仍保留。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：表格列的HeaderText和Width是[AJAX属性]， 所以可以在后台更改。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>setText / setWidth</code>（<strong>入学年份列</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：页面脚本取得对应列，分别设置标题与宽度；这是客户端方法更新专题。</li>
            </ul>
        </section>
    </template>
</body>
</html>
