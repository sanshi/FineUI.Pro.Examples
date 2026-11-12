<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="griddataurl_changedataurl_databasepaging.aspx.cs"
    Inherits="FineUI.Pro.Examples.griddataurl.griddataurl_changedataurl_databasepaging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/griddataurl/griddataurl_paging_database.ashx;~/griddataurl/griddataurl_paging_database2.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="false" EnableCheckBoxSelect="true" runat="server"
            DataIDField="Id" DataUrl="~/griddataurl/griddataurl_paging_database.ashx" AllowPaging="true" IsDatabasePaging="true" PageSize="5">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名">
                </f:RenderField>
                <f:RenderField ColumnID="Gender" DataField="Gender" FieldType="Int" RendererFunction="renderGender" HeaderText="性别">
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" HeaderText="入学年份">
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业">
                </f:RenderField>
                <f:RenderField ColumnID="Group" DataField="Group" RendererFunction="renderGroup" HeaderText="分组">
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button Text="切换网址数据源" runat="server" ID="btnRebind" OnClick="btnRebind_Click">
        </f:Button>

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在浏览器或后台切换数据地址，重新加载另一组记录，并回到新数据源第一页。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换地址后核对当前数据</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnRebind").ClientID %>'
                        title="切换网址数据源">切换网址数据源</strong>。<br />结果：脚本改用另一数据地址重新加载，原记录被替换，总行数和当前页码按新数据源更新。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>DataUrl</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>~/griddataurl/griddataurl_paging_database.ashx</code>，地址变化后请求新来源，避免只改字段而仍显示旧数据。
                </li>
                <li><code>loadDataUrl</code>（<strong>网址数据加载与页面脚本</strong>，作用于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：客户端入口同时更换地址并加载记录；后台入口设置
                    DataUrl 后由浏览器执行请求。</li>
            </ul>
        </section>
    </template>
</body>
</html>
