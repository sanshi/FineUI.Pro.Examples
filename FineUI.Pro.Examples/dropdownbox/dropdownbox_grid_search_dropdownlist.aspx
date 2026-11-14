<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_search_dropdownlist.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_search_dropdownlist" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉表格（下拉列表过滤，表头菜单过滤）"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MatchFieldWidth="false">
                    <PopPanel>
                        <f:Grid ID="Grid1" Width="650px" Height="300px" Hidden="true" DataIDField="Id" DataTextField="Name" EnableMultiSelect="true"
                            KeepCurrentSelection="true" PageSize="10" ShowBorder="true" ShowHeader="false" AllowPaging="true" IsDatabasePaging="true"
                            runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged" AllowSorting="true" SortField="Name"
                            SortDirection="ASC" OnSort="Grid1_Sort" AllowFilters="true" OnFilterChanged="Grid1_FilterChanged">
                            <Columns>
                                <f:RowNumberField />
                                <f:RenderField DataField="Name" SortField="Name" HeaderText="姓名" />
                                <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                                <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                                <f:RenderCheckField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                                <f:RenderField ExpandUnusedSpace="true" MinWidth="150px" ColumnID="Major" DataField="Major" HeaderText="所学专业"
                                    EnableFilter="true">
                                    <Filter>
                                        <Operator>
                                            <f:DropDownList ID="DropDownList1" runat="server">
                                                <f:ListItem Text="等于" Value="equal" />
                                                <f:ListItem Text="包含" Value="contain" Selected="true" />
                                                <f:ListItem Text="开始于" Value="start" />
                                                <f:ListItem Text="结束于" Value="end" />
                                            </f:DropDownList>
                                        </Operator>
                                    </Filter>
                                </f:RenderField>
                                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
                            </Columns>
                            <Toolbars>
                                <f:Toolbar runat="server" Position="Top">
                                    <Items>
                                        <f:Label ID="LabelExample1" runat="server" Text="是否在校："></f:Label>
                                        <f:DropDownList ID="ddlAtSchool" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" runat="server">
                                            <f:ListItem Text="全部" Value="-1" />
                                            <f:ListItem Text="在校" Value="1" />
                                            <f:ListItem Text="离校" Value="0" />
                                        </f:DropDownList>
                                    </Items>
                                </f:Toolbar>
                            </Toolbars>
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
            <p>组合在校状态下拉过滤和专业列表头过滤。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>组合下拉与表头过滤</h3>
            <ol>
                <li>
                    在弹出面板的<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("LabelExample1").ClientID %>' title="是否在校">是否在校</strong>下拉中选择<code>离校</code>。<br />
                    结果：后台按离校状态重新加载表格。
                </li>
                <li>
                    在“所学专业”列菜单启用过滤，选择<code>包含</code>并输入专业关键词。<br />
                    结果：专业条件与在校状态一起应用；这里过滤的是“所学专业”列，不是姓名列。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowFilters</code>（<strong class="example-control-reference" data-example-control="<%= Grid1.ClientID %>" title="表格">表格</strong>）：允许通过表头菜单设置过滤。 本页声明值为 <code>true</code>。</li>
                <li><code>OnFilterChanged</code>（<strong class="example-control-reference" data-example-control="<%= Grid1.ClientID %>" title="表格">表格</strong>）：过滤条件变化后重新加载匹配行。 本页声明值为 <code>Grid1</code><code>_FilterChanged</code>。</li>
                <li><code>OnSelectedIndexChanged</code>（<strong class="example-control-reference" data-example-control="<%= ddlAtSchool.ClientID %>" title="第 2 个下拉列表">第 2 个下拉列表</strong>）：筛选<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">下拉框</strong>改变后重新加载表格，保留本页的其它过滤条件。</li>
            </ul>
        </section>
    </template>
</body>
</html>
