<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_filter_complex.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_filter_complex" %>

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
                <f:RenderField ColumnID="Gender" HeaderText="性别" EnableFilter="true" DataField="Gender" RendererFunction="renderGender">
                    <Filter>
                        <Field>
                            <f:RadioButtonList runat="server">
                                <f:RadioItem Text="男" Value="1" />
                                <f:RadioItem Text="女" Value="0" />
                            </f:RadioButtonList>
                        </Field>
                    </Filter>
                </f:RenderField>
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
                <f:RenderCheckField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" EnableFilter="true">
                    <Filter>
                        <Field>
                            <f:RadioButtonList ID="RadioButtonList1" runat="server">
                                <f:RadioItem Text="在校" Value="true" />
                                <f:RadioItem Text="已离校" Value="false" />
                            </f:RadioButtonList>
                        </Field>
                    </Filter>
                </f:RenderCheckField>
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" EnableFilter="true" DataField="Major"
                    RendererFunction="renderMajor">
                    <Filter>
                        <Field>
                            <f:CheckBoxList ColumnNumber="1" runat="server">
                                <f:CheckItem Text="材料科学与工程系" Value="材料科学与工程系" />
                                <f:CheckItem Text="化学系" Value="化学系" />
                                <f:CheckItem Text="物理系" Value="物理系" />
                                <f:CheckItem Text="数学系" Value="数学系" />
                                <f:CheckItem Text="自动化系" Value="自动化系" />
                            </f:CheckBoxList>
                        </Field>
                    </Filter>
                </f:RenderField>
                <f:RenderField ColumnID="Group" HeaderText="分组" EnableFilter="true" DataField="Group" RendererFunction="renderGroup">
                    <Filter>
                        <Field>
                            <f:DropDownList ID="groupList" EnableMultiSelect="true" AutoSelectFirstItem="false" MultiSelectMode="Tags" runat="server">
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:RenderField>
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
            <p>组合文本、数字、日期、布尔和多选过滤字段，同时筛选不同列。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-search" aria-hidden="true"></i>让不同列条件共同生效</h3>
            <ol>
                <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>的<strong>入学年份</strong>列表头过滤菜单输入<code>2008</code>，保留本页的大于操作符并点击过滤面板的确定。<br />结果：过滤条件回发，后台按本页匹配规则筛选示例数据并重新绑定，下方同步显示过滤参数。年份条件按数值比较。
                </li>
                <li>再在<strong>所学专业</strong>过滤中选择化学系或物理系并应用。<br />结果：结果同时满足当前年份条件与专业选择；多选专业内部匹配其中一项即可，其他已设置列仍参与过滤。</li>
                <li>清除其中一列的条件。<br />结果：只取消这一列的限制，其他列条件继续生效；清空全部条件后恢复完整示例数据。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>AllowFilters</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为
                    <code>true</code>，统一启用表格过滤处理，各列配置自己的过滤字段。
                </li>
                <li><code>Filter / Field / Operator</code>（<strong>各列过滤器</strong>，位于<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>'
                        title="表格">表格</strong>）：文本、数字、日期、布尔及选项列分别使用对应输入和比较方式，后台或本页脚本按字段类型解释条件。</li>
            </ul>
        </section>
    </template>
</body>
</html>
