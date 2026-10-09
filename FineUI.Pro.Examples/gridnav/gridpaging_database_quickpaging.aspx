<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gridpaging_database_quickpaging.aspx.cs"
    Inherits="FineUI.Pro.Examples.gridnav.gridpaging_database_quickpaging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" Height="450px" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" OnPageIndexChanged="Grid1_PageIndexChanged" QuickPaging="true"
            MouseWheelSelection="true">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true" />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" ClickHandler="onNotifySelectedRowsClick">
        </f:Button>
        <br />
        <br />
        <ul>
            <li>本示例启用了QuickPaging，可以通过上下按键和鼠标滚轮（需设置MouseWheelSelection="true"）快速切换分页，分页后自动选中第一项或者最后一项。
                <ul>
                    <li>先选中一行，然后通过上下按键和鼠标滚轮来切换选中行。</li>
                    <li>选中最后一行，向下按键或者向下滚动鼠标滚轮，会自动切换到下一页，并选中第一行。</li>
                    <li>选中第一行，向上按键或者向上滚动鼠标滚轮，会自动切换到上一页，并选中最后一行。</li>
                </ul>
            </li>
        </ul>
    </form>

    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
