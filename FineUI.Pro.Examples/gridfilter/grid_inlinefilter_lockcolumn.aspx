<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_inlinefilter_lockcolumn.aspx.cs" Inherits="FineUI.Pro.Examples.grid.grid_inlinefilter_lockcolumn" %>

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
            AllowFilters="true" OnFilterChanged="Grid1_FilterChanged" InlineFilters="true" AllowColumnLocking="true">
            <Columns>
                <f:RowNumberField />
                <f:BoundField ColumnID="Name" Width="200px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" EnableFilter="true" EnableLock="true">
                </f:BoundField>
                <f:TemplateField ColumnID="Gender" HeaderText="性别" EnableLock="true" Locked="true">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" EnableLock="true" Locked="true" />
                <f:CheckBoxField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:BoundField ColumnID="LogTime" DataField="LogTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：内联过滤字段仅支持文本输入框、数字输入框、日期选择器、下拉列表控件（不支持多条件过滤）。
        <br />
        <br />
        <f:Label runat="server" ID="labResult" EncodeText="false"></f:Label>
    </form>
</body>
</html>
