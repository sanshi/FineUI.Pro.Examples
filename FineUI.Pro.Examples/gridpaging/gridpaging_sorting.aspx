<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_sorting.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_sorting" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" AllowSorting="true" SortField="Name" SortDirection="ASC"
            PageSize="5" ShowBorder="true" ShowHeader="true" AllowPaging="true" IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true"
            OnSort="Grid1_Sort">
            <Columns>
                <f:RowNumberField />
                <f:RenderField SortField="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
        <strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>将内存分页与后台排序结合，翻页继续沿用当前排序条件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>切换排序方向</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>入学年份</strong>列标题，再次点击同一列。<br />结果：列头操作回发后，后台读取排序字段与方向，重新绑定排序结果；先后采用升序与降序，列标题方向随之变化。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>在排序结果中换页</h3>
            <ul>
                <li>完成排序后点击下一页，再回到第一页。<br />结果：换页保留当前排序条件，数据按排序后的整体顺序分页，不只在当前页比较。</li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>SortField</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>Name</code>，指定排序使用的数据字段；未设置时初次加载不主动排序。
                </li>
                <li><code>SortDirection</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>ASC</code>，指定排序方向
                    ASC 或 DESC，并与重新绑定后的记录保持一致。</li>
            </ul>
        </section>
    </template>
</body>
</html>
