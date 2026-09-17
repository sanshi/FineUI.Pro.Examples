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
                <f:BoundField ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名" EnableFilter="true">
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
                <f:TemplateField ColumnID="Gender" HeaderText="性别" EnableFilter="true">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                    <Filter>
                        <Field>
                            <f:RadioButtonList runat="server">
                                <f:RadioItem Text="男" Value="1" />
                                <f:RadioItem Text="女" Value="0" />
                            </f:RadioButtonList>
                        </Field>
                    </Filter>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" EnableFilter="true">
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
                </f:BoundField>
                <f:CheckBoxField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" EnableFilter="true">
                    <Filter>
                        <Field>
                            <f:RadioButtonList ID="RadioButtonList1" runat="server">
                                <f:RadioItem Text="在校" Value="true" />
                                <f:RadioItem Text="已离校" Value="false" />
                            </f:RadioButtonList>
                        </Field>
                    </Filter>
                </f:CheckBoxField>
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" EnableFilter="true">
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
                </f:HyperLinkField>
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组" EnableFilter="true">
                    <Filter>
                        <Field>
                            <f:DropDownList ID="groupList" EnableMultiSelect="true" AutoSelectFirstItem="false" MultiSelectMode="Tags" runat="server">
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:ImageField>
                <f:BoundField ColumnID="LogTime" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" EnableFilter="true">
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
