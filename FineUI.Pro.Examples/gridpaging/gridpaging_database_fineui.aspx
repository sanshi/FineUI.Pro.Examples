<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_database_fineui.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_database_fineui" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" Title="表格" IsFluid="true" ShowBorder="true" ShowHeader="true" AllowPaging="true" IsDatabasePaging="true"
            PageSize="5" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用 ASP.NET 数据源控件为表格提供按页查询的数据与总记录数。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>读取各列数据</h3>
            <ul>
                <li>查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>中的姓名、性别、入学年份和专业。<br />结果：首次加载时后台绑定示例数据，各列按字段名称显示对应的学生信息。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>按页查看记录</h3>
            <ol>
                <li>点击分页栏的下一页，再点击上一页。<br />结果：每次换页请求后台按当前页码和页大小读取记录；页码和当前行一起更新。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataIDField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Id</code>，从每行数据读取稳定的业务主键，用于识别选中记录。
                </li>
                <li><code>DataTextField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：指定选中结果使用的显示文字字段。</li>
                <li><code>DataSource</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：后台提供数据集合并完成绑定；列按 DataField
                    读取当前行字段。</li>
            </ul>
        </section>
    </template>
</body>
</html>
