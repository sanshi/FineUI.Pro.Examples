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
                <f:BoundField ColumnID="Name" Width="200px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" EnableFilter="true">
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
                </f:BoundField>
                <f:TemplateField ColumnID="Gender" Width="200px" HeaderText="性别" EnableFilter="true">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                    <Filter>
                        <Field>
                            <f:DropDownList AutoSelectFirstItem="false" runat="server">
                                <f:ListItem Text="男" Value="1" />
                                <f:ListItem Text="女" Value="0" />
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" Width="200px" DataField="EntranceYear" HeaderText="入学年份" EnableFilter="true">
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
                </f:BoundField>
                <f:CheckBoxField ColumnID="AtSchool" Width="200px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" EnableFilter="true">
                    <Filter>
                        <Field>
                            <f:DropDownList AutoSelectFirstItem="false" runat="server">
                                <f:ListItem Text="在校" Value="true" />
                                <f:ListItem Text="已离校" Value="false" />
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:CheckBoxField>
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="200px" EnableFilter="true">
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
                </f:HyperLinkField>
                <f:ImageField ColumnID="Group" Width="260px" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组" EnableFilter="true">
                    <Filter>
                        <Field>
                            <f:DropDownList ID="groupList" EnableMultiSelect="true" AutoSelectFirstItem="false" MultiSelectMode="Tags" runat="server">
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:ImageField>
                <f:BoundField ColumnID="LogTime" Width="200px" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" EnableFilter="true">
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
                </f:BoundField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
</body>
</html>
