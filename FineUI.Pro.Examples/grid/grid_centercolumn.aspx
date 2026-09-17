<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_centercolumn.aspx.cs"
    Inherits="FineUI.Pro.Examples.data.grid_centercolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="false">
            <Columns>
                <f:RowNumberField></f:RowNumberField>
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="150px" TextAlign="Center" RenderAsStaticField="true" DataField="AtSchool"
                    HeaderText="是否在校（居中）" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业（居中）" TextAlign="Center" DataToolTipField="Major"
                    DataTextField="Major" DataTextFormatString="{0}" DataNavigateUrlFields="Major"
                    DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true"
                    Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField Width="250px" ColumnID="Group" TextAlign="Right" HeaderTextAlign="Left" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组（内容靠右，标题靠左）" />
            </Columns>
        </f:Grid>
        <br />
        <br />
    </form>
</body>
</html>
