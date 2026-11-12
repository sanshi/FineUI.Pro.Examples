<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_filter_operator.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_filter_operator" %>

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
                <f:RenderField ColumnID="Name" DataField="Name" HeaderText="姓名" EnableFilter="true">
                    <Filter>
                        <Operator>
                            <f:DropDownList runat="server">
                                <f:ListItem Text="等于" Value="equal" />
                                <f:ListItem Text="包含" Value="contain" Selected="true" />
                                <f:ListItem Text="开始于" Value="start" />
                                <f:ListItem Text="结束于" Value="end" />
                            </f:DropDownList>
                        </Operator>
                    </Filter>
                </f:RenderField>
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
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>为姓名过滤提供等于、包含、开始于和结束于操作符。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>保持输入并改变比较方式</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>姓名</strong>列表头过滤菜单输入<code>国</code>，选择包含并点击过滤面板的确定。<br />结果：保留<strong>姓名</strong>任意位置包含国的记录。</li>
                <li>保留输入国，将操作符改为开始于或结束于并应用。<br />结果：改按<strong>姓名</strong>开头或末尾匹配，过滤参数中的操作符随之变化；输入相同不代表过滤结果一定相同。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Filter.Operator</code>（<strong>姓名列过滤器</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：使用下拉选项提供
                    equal、contain、start、end，本页匹配函数分别解释各个操作符。</li>
            </ul>
        </section>
    </template>
</body>
</html>
