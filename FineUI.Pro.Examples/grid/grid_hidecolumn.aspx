<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_hidecolumn.aspx.cs"
    Inherits="FineUI.Pro.Examples.grid.grid_hidecolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid DataIDField="Id" ID="Grid1" IsFluid="true" Title="表格" EnableCollapse="false" ShowBorder="true" ShowHeader="true" runat="server"
            EnableCheckBoxSelect="true" EnableHeaderMenu="true">
            <Columns>
                <f:RowNumberField />
                <f:RenderField DataField="Name" HeaderText="姓名" />
                <f:RenderField Hidden="true" EnableColumnHide="false" ColumnID="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
                <f:RenderField ColumnID="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:RenderCheckField RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
                <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button3" runat="server" Text="显示/隐藏[性别]列" CssClass="marginr" OnClick="Button3_Click">
        </f:Button>
        <f:Button ID="Button4" runat="server" Text="获得隐藏列列表" OnClick="Button4_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="改变[入学年份]的表头菜单隐藏列功能" CssClass="marginr" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        注：性别列设置了EnableColumnHide=false，所以不能通过标题栏菜单隐藏，但仍然可以通过后台代码隐藏。
        <br />
        <br />
        <f:Label runat="server" EncodeText="false" ID="labHiddenColumns">
        </f:Label>
        <br />
        <br />
        <br />
        <br />
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
</body>
</html>
