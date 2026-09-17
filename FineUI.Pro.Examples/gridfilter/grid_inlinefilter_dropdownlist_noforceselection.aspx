<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_inlinefilter_dropdownlist_noforceselection.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_inlinefilter_dropdownlist_noforceselection" %>

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
                <f:BoundField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份">
                </f:BoundField>
                <f:CheckBoxField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校">
                </f:CheckBoxField>
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" EnableFilter="true">
                    <Filter>
                        <Field>
                            <f:DropDownList AutoSelectFirstItem="false" EnableMultiSelect="true" EnableEdit="true" ForceSelection="false" runat="server">
                                <f:ListItem Text="材料科学与工程系" Value="材料科学与工程系" />
                                <f:ListItem Text="化学系" Value="化学系" />
                                <f:ListItem Text="物理系" Value="物理系" />
                                <f:ListItem Text="数学系" Value="数学系" />
                                <f:ListItem Text="自动化系" Value="自动化系" />
                            </f:DropDownList>
                        </Field>
                    </Filter>
                </f:HyperLinkField>
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField ColumnID="LogTime" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期">
                </f:BoundField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
        <br />
        <br />
        注：所学专业的过滤下拉列表可以自行输入值，尝试输入字符“学”试下。
    </form>
</body>
</html>
