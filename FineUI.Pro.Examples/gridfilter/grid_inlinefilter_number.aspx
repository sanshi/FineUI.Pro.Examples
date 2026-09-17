<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_inlinefilter_number.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_inlinefilter_number" %>

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
                <f:BoundField ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名">
                </f:BoundField>
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" Width="200px" DataField="EntranceYear" HeaderText="入学年份" EnableFilter="true">
                    <Filter EnableMultiConditions="true">
                        <Operator>
                            <f:DropDownList ID="DropDownList1" runat="server">
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
                <f:CheckBoxField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px">
                </f:HyperLinkField>
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField ColumnID="LogTime" Width="200px" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" EnableFilter="true">
                    <Filter EnableMultiConditions="true">
                        <Operator>
                            <f:DropDownList ID="DropDownList2" runat="server">
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
