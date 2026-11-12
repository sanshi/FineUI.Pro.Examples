<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_inlinefilter_initvalue.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_inlinefilter_initvalue" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/Code/NewFilteredTable.cs" />

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            AllowFilters="true" OnFilterChanged="Grid1_FilterChanged" InlineFilters="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" Width="200px" DataField="Name" HeaderText="姓名" EnableFilter="true" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="btnUpdateFilteredData" CssClass="marginr" Text="后台更新过滤数据" OnClick="btnUpdateFilteredData_Click" runat="server">
        </f:Button>
        <br />
        <br /><br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>初次加载即应用内联过滤条件，并允许由后台按钮替换整组条件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>核对初始过滤与后续替换</h3>
            <ol>
                <li>刚打开页面时查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>及对应过滤入口。<br />结果：<strong>姓名</strong>已带有包含张的条件，记录已经按这些条件筛选；再次打开过滤区域可看到相同的当前条件。</li>
                <li>点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUpdateFilteredData").ClientID %>'
                        title="后台更新过滤数据">后台更新过滤数据</strong>。<br />结果：后台先清除旧过滤，再设置新条件并重新绑定；<strong>姓名</strong>条件改为包含婷婷。过滤入口、记录和下方参数同步更新。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：内联过滤字段仅支持文本输入框、数字输入框、日期选择器、下拉列表控件（不支持多条件过滤）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ColumnFilteredData / FilteredData</code>（<strong>列过滤状态与表格过滤集合</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：初始条件在首次绑定前设置；替换时清除旧集合，避免新旧条件意外叠加。</li>
                <li><code>InlineFilters</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，把当前条件直接显示在列下方，不通过独立弹出面板输入。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
