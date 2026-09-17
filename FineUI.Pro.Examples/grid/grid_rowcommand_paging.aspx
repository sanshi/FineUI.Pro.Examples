<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_paging.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_rowcommand_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（内存分页）" EnableCollapse="false" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="false" PageSize="5" runat="server" DataKeyNames="Id,Name"
            Height="300px" OnRowCommand="Grid1_RowCommand" EnableCheckBoxSelect="false">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true"></f:RowNumberField>
                <f:BoundField DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField ColumnID="Gender" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ColumnID="Major" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="true" MinWidth="150px" />
                <f:ImageField ColumnID="Group" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png" HeaderText="分组" />
                <f:LinkButtonField ColumnID="Action1" CommandName="Action1" Text="按钮 1" />
                <f:LinkButtonField ColumnID="Action2" ConfirmText="你确定要这么做么？" ConfirmTarget="Top"
                    CommandName="Action2" Text="按钮 2" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        <strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
    </form>
</body>
</html>
