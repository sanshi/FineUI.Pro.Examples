<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownbox_grid_layout_alwaysdisplay_defaultvalue.aspx.cs"
    Inherits="FineUI.Pro.Examples.dropdownbox.dropdownbox_grid_layout_alwaysdisplay_defaultvalue" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" BodyPadding="10px" runat="server" EnableCollapse="false" ShowBorder="true" Title="始终显示弹出面板（初始值）"
            ShowHeader="true">
            <Items>
                <f:DropDownBox runat="server" ID="DropDownBox1" EmptyText="请从下面表格中选择" DataControlID="Grid1" PopPanelID="Panel7" AlwaysDisplayPopPanel="true"
                    EnableMultiSelect="true" MatchFieldWidth="false" AutoShowClearIcon="true" Values="115,105" Texts="董国,吴颖颖">
                </f:DropDownBox>
                <f:Panel ID="Panel7" runat="server" BodyPadding="10px" Height="300px" ShowBorder="true" ShowHeader="false" Layout="VBox" BoxConfigSpace="5">
                    <Items>
                        <f:Form ID="Form5" ShowBorder="false" ShowHeader="false" RemoveLastFieldsMargin="true" runat="server">
                            <Rows>
                                <f:FormRow>
                                    <Items>
                                        <f:TwinTriggerBox Width="300px" runat="server" EmptyText="在姓名中查找" ShowLabel="false" ID="ttbSearch" ShowTrigger1="false"
                                            OnTrigger1Click="ttbSearch_Trigger1Click" OnTrigger2Click="ttbSearch_Trigger2Click" Trigger1Icon="Clear"
                                            Trigger2Icon="Search">
                                        </f:TwinTriggerBox>
                                        <f:RadioButtonList ID="rblAtSchool" Label="是否在校" OnSelectedIndexChanged="rblAtSchool_SelectedIndexChanged"
                                            runat="server">
                                            <f:RadioItem Text="全部" Value="-1" Selected="true" />
                                            <f:RadioItem Text="在校" Value="1" />
                                            <f:RadioItem Text="离校" Value="0" />
                                        </f:RadioButtonList>
                                    </Items>
                                </f:FormRow>
                            </Rows>
                        </f:Form>
                        <f:Grid ID="Grid1" BoxFlex="1" DataIDField="Id" DataTextField="Name" EnableMultiSelect="true" KeepCurrentSelection="true" PageSize="10"
                            ShowBorder="true" ShowHeader="false" AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true"
                            OnPageIndexChanged="Grid1_PageIndexChanged" AllowSorting="true" SortField="Name" SortDirection="ASC" OnSort="Grid1_Sort">
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
                    </Items>
                </f:Panel>
            </Items>
        </f:SimpleForm>
        <br />
        <f:Button ID="btnGetSelection" Text="获取下拉框的选中值" CssClass="marginr" runat="server" OnClick="btnGetSelection_Click">
        </f:Button>
        <f:Button ID="btnClearValue" Text="清空下拉框的值" runat="server" OnClick="btnClearValue_Click">
        </f:Button>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>


    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>让带筛选的选人表格始终显示，并保留预设的人员选择。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>打开页面即可操作</h3>
            <ol>
                <li>
                    初次打开页面。<br />
                    结果：筛选与表格面板已经显示，无需先点击下拉箭头；选择数据仍通过关联<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下面表格中选择">下拉框</strong>统一保存。
                </li>
                <li>
                    初次打开时直接查看输入区的已选文字。<br />
                    结果：初始业务值与显示文字一起提供，即使对应人员不在当前页也能显示初始选择。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：通过 <code>Values</code> 和 <code>Text</code> 属性来设置<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                    title="请从下面表格中选择">下拉框</strong>的初始值（由于初始值可能不在第一页，所以需要指定 <code>Text</code> 属性）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AlwaysDisplayPopPanel</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下面表格中选择">请从下面表格中选择</strong>）：让弹出面板保持可见，选择和筛选不依赖再次展开。 本页声明值为 <code>true</code>。</li>
                <li><code>Values</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下面表格中选择">请从下面表格中选择</strong>）：指定初始多选值。 本页声明值为 <code>115</code>,<code>105</code>。</li>
                <li><code>Texts</code>（<strong class="example-control-reference" data-example-control="<%= DropDownBox1.ClientID %>"
                        title="请从下面表格中选择">请从下面表格中选择</strong>）：为初始值提供对应文字，尤其适用于尚未加载到当前页的数据。 本页声明值为 董国,吴颖颖。</li>
            </ul>
        </section>
    </template>
</body>
</html>
