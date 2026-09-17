<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_pagesizeoptions.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridpaging.gridpaging_pagesizeoptions" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格（内存分页 + 页大小选择器）" EnableCollapse="false" PageSize="10" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="false" ShowPageSizeSelector="true" runat="server" EnableCheckBoxSelect="true" Height="350px">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" />
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
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
        <strong>只需设置 ShowPageSizeSelector="true" 即可显示页大小选择器（未设置 PageSizeOptions 时使用默认选项 10,20,50,100）。出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
