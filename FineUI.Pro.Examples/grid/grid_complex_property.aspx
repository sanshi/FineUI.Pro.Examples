<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_complex_property.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_complex_property" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格"  EnableCollapse="false" PageSize="3" ShowBorder="true"
        ShowHeader="true" runat="server" EnableCheckBoxSelect="true"
       >
        <Columns>
            <f:RowNumberField />
            <f:BoundField DataField="MyText" SortField="MyText" DataFormatString="{0}" HeaderText="姓名" />
            <f:BoundField DataField="Year" HeaderText="入学年份" />
            <f:CheckBoxField DataField="MyCheckBox" HeaderText="是否在校" />
            <f:TemplateField HeaderText="是否在校">
                <ItemTemplate>
                    <%-- Container.DataItem should be System.Data.DataRowView or Custom Class --%>
                    <%-- <%# DataBinder.Eval(Container.DataItem, "MyText") %> --%>
                    <%# GetInSchool(Eval("MyCheckBox")) %>
                </ItemTemplate>
            </f:TemplateField>
            <f:BoundField ExpandUnusedSpace="true" MinWidth="150px" DataField="Info.UserName" DataFormatString="{0}"
                HeaderText="老师（二级属性）" />
        </Columns>
    </f:Grid>
    </form>
</body>
</html>
