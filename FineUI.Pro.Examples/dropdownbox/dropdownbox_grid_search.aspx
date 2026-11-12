<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_search.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_search" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="下拉表格（输入框过滤）"
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
                            <Toolbars>
                                <f:Toolbar runat="server" Position="Top">
                                    <Items>
                                        <f:TwinTriggerBox Width="300px" runat="server" EmptyText="在姓名中查找" ShowLabel="false" ID="ttbSearch" ShowTrigger1="false"
                                            OnTrigger1Click="ttbSearch_Trigger1Click" OnTrigger2Click="ttbSearch_Trigger2Click" Trigger1Icon="Clear"
                                            Trigger2Icon="Search">
                                        </f:TwinTriggerBox>
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
            <p>按姓名关键词过滤分页表格，并可清空搜索条件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>按姓名过滤并恢复</h3>
            <ol>
                <li>
                    展开面板，在<strong class="example-control-reference" data-example-control="<%= ttbSearch.ClientID %>" title="在姓名中查找">在姓名中查找</strong>中输入<code>金</code>，点击搜索图标。<br />
                    结果：后台按姓名筛选，表格只显示姓名含“金”的人员；仍可选择<code>金婷婷</code>。
                </li>
                <li>
                    点击搜索框新显示的清空图标。<br />
                    结果：搜索文字清除，清空图标隐藏；表格重新加载全部人员。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>OnTrigger2Click</code>（<strong class="example-control-reference" data-example-control="<%= ttbSearch.ClientID %>" title="在姓名中查找">在姓名中查找</strong>）：搜索触发器读取当前姓名关键词，重新加载符合条件的表格数据。</li>
                <li><code>OnTrigger1Click</code>（<strong class="example-control-reference" data-example-control="<%= ttbSearch.ClientID %>" title="在姓名中查找">在姓名中查找</strong>）：清空触发器移除关键词并恢复未过滤的数据。</li>
            </ul>
        </section>
    </template>
</body>
</html>
