<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_paging_database_defaultvalue.aspx.cs" Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_paging_database_defaultvalue" %>

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
            <p>演示对应节点或人员尚未加载时，仍显示由后台提供的初始业务值和文字。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>先显示尚未加载项的初始选择</h3>
            <ol>
                <li>
                    初次打开时查看输入区，再展开面板查看当前页的数据。<br />
                    结果：输入区已经显示初始文字，不要求初始项先出现在当前页的数据中。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：通过 <code>Values</code> 和 <code>Text</code> 属性来设置<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                    title="请从下拉表格中选择">下拉框</strong>的初始值（由于初始值可能不在第一页，所以需要指定 <code>Text</code> 属性）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Values</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下拉表格中选择">请从下拉表格中选择</strong>）：指定初始多选值。 本页声明值为 <code>115</code>,<code>105</code>。</li>
                <li><code>Texts</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下拉表格中选择">请从下拉表格中选择</strong>）：为初始值提供对应文字，尤其适用于尚未加载到当前页的数据。 本页声明值为 董国,吴颖颖。</li>
            </ul>
        </section>
    </template>
</body>
</html>
