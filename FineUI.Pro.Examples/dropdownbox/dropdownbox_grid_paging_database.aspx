<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_paging_database.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_paging_database" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉表格（数据库分页）"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MatchFieldWidth="false">
                    <PopPanel>
                        <f:Grid ID="Grid1" Width="650px" Height="300px" Hidden="true" DataIDField="Id" DataTextField="Name" EnableMultiSelect="true"
                            KeepCurrentSelection="true" PageSize="10" ShowBorder="true" ShowHeader="false" AllowPaging="true" IsDatabasePaging="true"
                            runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged" AllowSorting="true" SortField="Name"
                            SortDirection="ASC" OnSort="Grid1_Sort">
                            <Columns>
                                <f:RowNumberField />
                                <f:RenderField DataField="Name" SortField="Name" HeaderText="姓名" />
                                <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                                <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                                <f:RenderCheckField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" HeaderText="所学专业" />
                                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                            </Columns>
                        </f:Grid>


                    </PopPanel>
                </f:DropDownBox>
                <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按需加载当前页人员数据并保留跨页选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>继续跨页选择</h3>
            <ol>
                <li>
                    刷新当前示例以回到未过滤的初始状态，在第一页找到“金婷婷”；只有该行未选中时才勾选，然后点击分页条的下一页。<br />
                    结果：翻页回发后由后台只返回当前页数据；第一页的选择继续保留。
                </li>
                <li>
                    在第二页找到“董超”，只有未选中时才勾选，再获取<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">下拉框</strong>选中值。<br />
                    结果：结果同时包含前后两页的人员，包括 <code>103</code> 和 <code>108</code>，不会只剩第二页。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowPaging</code>（<strong class="example-control-reference" data-example-control="<%= Grid1.ClientID %>" title="表格">表格</strong>）：为弹出表格提供分页工具栏。 本页声明值为 <code>true</code>。</li>
                <li><code>IsDatabasePaging</code>（<strong class="example-control-reference" data-example-control="<%= Grid1.ClientID %>" title="表格">表格</strong>）：为 <code>true</code> 时后台按当前页加载；为 <code>false</code> 时浏览器对已加载数据分页。 本页声明值为 <code>true</code>。</li>
                <li><code>PageSize</code>（<strong class="example-control-reference" data-example-control="<%= Grid1.ClientID %>" title="表格">表格</strong>）：决定每页显示多少条数据。 本页声明值为 <code>10</code>。</li>
                <li><code>KeepCurrentSelection</code>（<strong class="example-control-reference" data-example-control="<%= Grid1.ClientID %>" title="表格">表格</strong>）：在继续选择或翻页时保留已有选择。 本页声明值为 <code>true</code>。</li>
                <li><code>OnPageIndexChanged</code>（<strong class="example-control-reference" data-example-control="<%= Grid1.ClientID %>" title="表格">表格</strong>）：翻页后重新取得当前页数据并绑定。 本页声明值为 <code>Grid1</code><code>_PageIndexChanged</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
