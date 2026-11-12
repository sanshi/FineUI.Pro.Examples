<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_inlinefilter_complex_initvalue.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_inlinefilter_complex_initvalue" %>

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
            AllowFilters="true" OnFilterChanged="Grid1_FilterChanged" InlineFilters="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="Name" Width="200px" DataField="Name" HeaderText="姓名" EnableFilter="true">
                    <Filter EnableMultiConditions="true" MatcherDefault="any">
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
                <f:RenderField ColumnID="Gender" Width="200px" HeaderText="性别" EnableFilter="true" DataField="Gender" RendererFunction="renderGender">
                    <Filter>
                        <Field>
                            <f:DropDownList AutoSelectFirstItem="false" runat="server">
                                <f:ListItem Text="男" Value="1" />
                                <f:ListItem Text="女" Value="0" />
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:RenderField>
                <f:RenderField ColumnID="EntranceYear" Width="200px" DataField="EntranceYear" HeaderText="入学年份" EnableFilter="true">
                    <Filter EnableMultiConditions="true">
                        <Operator>
                            <f:DropDownList runat="server">
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
                <f:RenderCheckField ColumnID="AtSchool" Width="200px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" EnableFilter="true">
                    <Filter>
                        <Field>
                            <f:DropDownList AutoSelectFirstItem="false" runat="server">
                                <f:ListItem Text="在校" Value="true" />
                                <f:ListItem Text="已离校" Value="false" />
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:RenderCheckField>
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="200px" EnableFilter="true" DataField="Major"
                    RendererFunction="renderMajor">
                    <Filter>
                        <Field>
                            <f:DropDownList EnableMultiSelect="true" AutoSelectFirstItem="false" MultiSelectMode="Tags" runat="server">
                                <f:ListItem Text="材料科学与工程系" Value="材料科学与工程系" />
                                <f:ListItem Text="化学系" Value="化学系" />
                                <f:ListItem Text="物理系" Value="物理系" />
                                <f:ListItem Text="数学系" Value="数学系" />
                                <f:ListItem Text="自动化系" Value="自动化系" />
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:RenderField>
                <f:RenderField ColumnID="Group" Width="260px" HeaderText="分组" EnableFilter="true" DataField="Group" RendererFunction="renderGroup">
                    <Filter>
                        <Field>
                            <f:DropDownList ID="groupList" EnableMultiSelect="true" AutoSelectFirstItem="false" MultiSelectMode="Tags" runat="server">
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:RenderField>
                <f:RenderField ColumnID="LogTime" Width="200px" DataField="LogTime" HeaderText="注册日期" EnableFilter="true" FieldType="Date" Renderer="Date"
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
        <f:Button ID="btnUpdateFilteredData" CssClass="marginr" Text="后台更新过滤数据" OnClick="btnUpdateFilteredData_Click" runat="server">
        </f:Button>
        <br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>初次加载即应用内联过滤条件，并允许由后台按钮替换整组条件。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>核对初始过滤与后续替换</h3>
            <ol>
                <li>刚打开页面时查看<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>及对应过滤入口。<br />结果：<strong><strong>入学年份</strong></strong>、<strong>所学专业</strong>与<strong>分组</strong>已带有初始条件，记录已经按这些条件筛选；再次打开过滤区域可看到相同的当前条件。
                </li>
                <li>点击<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnUpdateFilteredData").ClientID %>'
                        title="后台更新过滤数据">后台更新过滤数据</strong>。<br />结果：后台先清除旧过滤，再设置新条件并重新绑定；原专业、<strong>分组</strong>等条件被替换，改用按钮指定的<strong>性别</strong>与年份条件。过滤入口、记录和下方参数同步更新。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ColumnFilteredData / FilteredData</code>（<strong>列过滤状态与表格过滤集合</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：初始条件在首次绑定前设置；替换时清除旧集合，避免新旧条件意外叠加。</li>
                <li><code>InlineFilters</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，把当前条件直接显示在列下方，不通过独立弹出面板输入。
                </li>
            </ul>
        </section>
    </template>
</body>
</html>
