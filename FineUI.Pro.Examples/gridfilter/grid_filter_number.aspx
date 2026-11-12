<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_filter_number.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_filter_number" %>

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
            AllowFilters="true" OnFilterChanged="Grid1_FilterChanged">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" EnableFilter="true">
                    <Filter EnableMultiConditions="true">
                        <Operator>
                            <f:DropDownList ID="DropDownList2" runat="server">
                                <f:ListItem Text="大于" Value="greater" Selected="true" />
                                <f:ListItem Text="小于" Value="less" />
                                <f:ListItem Text="等于" Value="equal" />
                            </f:DropDownList>
                        </Operator>
                        <Field>
                            <f:NumberBox runat="server" ID="NumberBox1" NoDecimal="true" NoNegative="true"></f:NumberBox>
                        </Field>
                    </Filter>
                </f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                <f:RenderField ColumnID="LogTime" DataField="LogTime" HeaderText="注册日期" EnableFilter="true" FieldType="Date" Renderer="Date"
                    RendererArgument="yyyy-MM-dd">
                    <Filter EnableMultiConditions="true">
                        <Operator>
                            <f:DropDownList ID="DropDownList3" runat="server">
                                <f:ListItem Text="大于" Value="greater" Selected="true" />
                                <f:ListItem Text="小于" Value="less" />
                                <f:ListItem Text="等于" Value="equal" />
                            </f:DropDownList>
                        </Operator>
                        <Field>
                            <f:DatePicker runat="server" ID="DatePicker1"></f:DatePicker>
                        </Field>
                    </Filter>
                </f:RenderField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>使用数字与日期输入过滤器，按实际数值或日期比较。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>分别按年份与日期筛选</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>入学年份</strong>列表头过滤菜单输入<code>2000</code>，保留大于比较并点击过滤面板的确定。<br />结果：过滤条件回发，后台按本页匹配规则筛选示例数据并重新绑定，下方同步显示过滤参数。显示年份大于
                    2000 的记录，不按文本字母顺序比较。</li>
                <li>在<strong>注册日期</strong>过滤中选择一个日期并应用。<br />结果：记录进一步按日期条件筛选；清除日期条件只撤销日期限制，已设置的年份条件保留。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Filter.Field</code>（<strong>入学年份与注册日期过滤器</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：分别使用 NumberBox 与
                    DatePicker，让输入类型与匹配数据类型一致；日期按页面格式解析。</li>
            </ul>
        </section>
    </template>
</body>
</html>
