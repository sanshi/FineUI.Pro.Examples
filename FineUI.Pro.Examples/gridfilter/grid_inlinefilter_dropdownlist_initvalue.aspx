<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_inlinefilter_dropdownlist_initvalue.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_inlinefilter_dropdownlist_initvalue" %>

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
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" EnableFilter="true" DataField="Major"
                    RendererFunction="renderMajor">
                    <Filter>
                        <Field>
                            <f:DropDownList EnableEdit="false" AutoSelectFirstItem="false" EnableMultiSelect="true" MultiSelectMode="Tags" runat="server">
                                <f:ListItem Text="材料科学与工程系" Value="材料科学与工程系" />
                                <f:ListItem Text="化学系" Value="化学系" />
                                <f:ListItem Text="物理系" Value="物理系" />
                                <f:ListItem Text="数学系" Value="数学系" />
                                <f:ListItem Text="自动化系" Value="自动化系" />
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:RenderField>
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="btnUpdateFilteredData" CssClass="marginr" Text="后台更新过滤数据" OnClick="btnUpdateFilteredData_Click" runat="server">
        </f:Button>
        <br />
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
                        title="表格">表格</strong>及对应过滤入口。<br />结果：专业已选中化学系、物理系和数学系，记录已经按这些条件筛选；再次打开过滤区域可看到相同的当前条件。</li>
                <li>点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUpdateFilteredData").ClientID %>'
                        title="后台更新过滤数据">后台更新过滤数据</strong>。<br />结果：后台先清除旧过滤，再设置新条件并重新绑定；专业改为材料科学与工程系。过滤入口、记录和下方参数同步更新。</li>
            </ol>
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
