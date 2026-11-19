<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_paging_database_updatevalue.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_paging_database_updatevalue" %>

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
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下拉表格中选择" EnableMultiSelect="true" MatchFieldWidth="false" Values="115,105"
                    Texts="董国,吴颖颖">
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
                <f:Panel CssClass="f-field" ShowBorder="false" ShowHeader="false" runat="server">
                    <Items>
                        <f:Button ID="btnUpdateValue" CssClass="marginr" Text="更新下拉框的值为[张娟娟,叶鹏]" runat="server" OnClick="btnUpdateValue_Click">
                        </f:Button>
                        <f:Button ID="btnClearValue" CssClass="marginr" Text="清空下拉框的值" runat="server" OnClick="btnClearValue_Click">
                        </f:Button>
                        <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                        </f:Button>
                    </Items>
                </f:Panel>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>按需加载当前页人员数据并保留跨页选择，按钮请求后台替换选中人员。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>通过按钮更新选择</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnUpdateValue.ClientID %>"
                        title="更新下拉框的值为[张娟娟,叶鹏]">更新下拉框的值为[张娟娟,叶鹏]</strong>。<br />
                    结果：回发后由后台把当前选择替换为按钮指定的人名或语言；输入区和重新展开的选择状态同步更新。
                </li>
                <li>
                    再点击<strong class="example-control-reference" data-example-control="<%= btnGetSelection.ClientID %>"
                        title="获取下拉框的选中值">获取下拉框的选中值</strong>。<br />
                    结果：读取结果反映刚更新的选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>清空当前选择</h3>
            <ol>
                <li>
                    点击<strong class="example-control-reference" data-example-control="<%= btnClearValue.ClientID %>"
                        title="清空下拉框的值">清空下拉框的值</strong>，再获取当前选中值。<br />
                    结果：输入文字、选择值及标签被清除，读取结果显示<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下拉表格中选择">下拉框</strong>为空。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Value</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下拉表格中选择">请从下拉表格中选择</strong>）：按钮处理后更新<strong class="example-control-reference"
                        data-example-control="<%= DropDownBox1.ClientID %>" title="请从下拉表格中选择">下拉框</strong>当前选中值，显示文字随本页的选中数据同步更新。</li>
            </ul>
        </section>
    </template>
</body>
</html>
