<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card_avatar.aspx.cs" Inherits="FineUI.Pro.Examples.gridcard.card_avatar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/js/gridcard.js" />
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">

        <link type="text/css" rel="stylesheet" href="<%= PageContext.ResolveUrl("~/res/css/gridcard.css") %>" />
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false" DataIDField="Id"
            DisplayType="Card" CardRendererFunction="renderCardWithAvatar" DataAttributeFields="Name,Gender,Avatar,EntranceYear,Status">
            <Columns>
                <f:RowNumberField />
                <f:RenderField ColumnID="UserProfile" Width="250" RendererFunction="renderUserProfile" HeaderText="基本信息"></f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" />
                <f:RenderField ColumnID="ChineseScore" DataField="ChineseScore" HeaderText="语文成绩" />
                <f:RenderField ColumnID="MathScore" DataField="MathScore" HeaderText="数学成绩" />
                <f:RenderField ColumnID="TotalScore" DataField="TotalScore" HeaderText="总成绩" />
                <f:RenderField ColumnID="Status" DataField="Status" RendererFunction="renderStatus" HeaderText="状态" />
            </Columns>
        </f:Grid>
    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/gridcard.js") %>"></script>
</body>
</html>
