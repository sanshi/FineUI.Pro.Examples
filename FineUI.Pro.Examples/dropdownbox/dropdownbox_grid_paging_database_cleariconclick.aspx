<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_paging_database_cleariconclick.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_paging_database_cleariconclick" %>

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
                    Texts="董国,吴颖颖" AutoShowClearIcon="true" EnableClearIconClickEvent="true" OnClearIconClick="DropDownBox1_ClearIconClick">
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
                <f:Button ID="btnGetSelection" CssClass="marginr" Text="获取下拉框的选中值" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
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
            <p>按需加载当前页人员数据并保留跨页选择，点击清空图标后回发处理。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>点击清空图标</h3>
            <ol>
                <li>
                    确保已有选择，点击输入区清空图标。<br />
                    结果：当前选择被清空，后台清空事件显示“你点击了清空图标”。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AutoShowClearIcon</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下拉表格中选择">请从下拉表格中选择</strong>）：有内容时显示清空全部选择的图标。 本页声明值为 <code>true</code>。</li>
                <li><code>OnClearIconClick</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下拉表格中选择">请从下拉表格中选择</strong>）：清空动作完成后请求后台处理。 本页声明值为 <code>DropDownBox1</code><code>_ClearIconClick</code>。</li>
            </ul>
        </section>
    </template>
</body>
</html>
