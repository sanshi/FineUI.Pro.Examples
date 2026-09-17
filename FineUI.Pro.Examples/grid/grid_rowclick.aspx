<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowclick.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowclick" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格"  EnableCollapse="false" ShowBorder="true" ShowHeader="true"
        runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name"
        EnableMultiSelect="false" EnableRowClickEvent="true" OnRowClick="Grid1_RowClick">
        <Columns>
            <f:RowNumberField />
            <f:BoundField ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
            <f:TemplateField ColumnID="Gender" HeaderText="性别">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                </ItemTemplate>
            </f:TemplateField>
            <f:BoundField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
            <f:CheckBoxField ColumnID="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
            <f:HyperLinkField HeaderText="所学专业" ColumnID="Major" DataToolTipField="Major" DataTextField="Major"
                DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
            <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
        </Columns>
    </f:Grid>
    <br />
    </form>
</body>
</html>
