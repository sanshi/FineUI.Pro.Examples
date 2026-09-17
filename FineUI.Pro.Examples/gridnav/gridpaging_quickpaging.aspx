<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_quickpaging.aspx.cs" Inherits="FineUI.Pro.Examples.gridnav.gridpaging_quickpaging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="true" Height="450px"
            QuickPaging="true" MouseWheelSelection="true">
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
        <ul>
            <li><strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong></li>
            <li>本示例启用了QuickPaging，可以通过上下按键和鼠标滚轮（需设置MouseWheelSelection="true"）快速切换分页，分页后自动选中第一项或者最后一项。
                <ul>
                    <li>先选中一行，然后通过上下按键和鼠标滚轮来切换选中行。</li>
                    <li>选中最后一行，向下按键或者向下滚动鼠标滚轮，会自动切换到下一页，并选中第一行。</li>
                    <li>选中第一行，向上按键或者向上滚动鼠标滚轮，会自动切换到上一页，并选中最后一行。</li>
                </ul>
            </li>
        </ul>
        
    </form>

    <script src="../res/js/grid.js"></script>
</body>
</html>
