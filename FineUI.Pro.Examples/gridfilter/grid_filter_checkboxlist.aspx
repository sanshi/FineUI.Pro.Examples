<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_filter_checkboxlist.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_filter_checkboxlist" %>

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
            AllowFilters="true" OnFilterChanged="Grid1_FilterChanged" EnableCheckBoxSelect="true">
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
                            <f:CheckBoxList ID="CheckBoxList1" ColumnNumber="1" runat="server">
                                <f:CheckItem Text="材料科学与工程系" Value="材料科学与工程系" />
                                <f:CheckItem Text="化学系" Value="化学系" />
                                <f:CheckItem Text="物理系" Value="物理系" />
                                <f:CheckItem Text="数学系" Value="数学系" />
                                <f:CheckItem Text="自动化系" Value="自动化系" />
                            </f:CheckBoxList>
                        </Field>
                    </Filter>
                </f:RenderField>
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" FieldType="Date" Renderer="Date" RendererArgument="yyyy-MM-dd" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>通过复选框列表过滤所学专业，保留任一所选专业的记录。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>按多个专业筛选</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>所学专业</strong>列表头过滤菜单选择化学系和物理系，再点击过滤面板的确定。<br />结果：提交的是专业值数组；匹配化学系或物理系任意一项的记录保留，不要求同一学生同时属于两个专业。</li>
                <li>清除本列过滤条件。<br />结果：取消专业限制并恢复其他条件允许显示的记录；没有其他条件时恢复全表。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Filter.Field</code>（<strong>所学专业列过滤器</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：采用
                    CheckBoxList，多个勾选值作为同一列的可选匹配值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
