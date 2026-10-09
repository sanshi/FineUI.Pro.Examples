<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_inlinefilter_complex.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_inlinefilter_complex" %>

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
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
