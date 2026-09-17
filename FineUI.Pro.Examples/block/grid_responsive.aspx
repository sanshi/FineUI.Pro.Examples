<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_responsive.aspx.cs" Inherits="FineUI.Pro.Examples.block.grid_responsive" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/css/responsive_card.css;~/res/js/grid.js;~/res/js/responsive_card.js" />
    <link href="../res/css/responsive_card.css" rel="stylesheet" />
    <style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" CssClass="responsive-card-grid" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            DataIDField="Id" DataAttributeFields="Name,Gender,Avatar,EntranceYear,Status,Desc"
            ResponsiveCardSize="MD" CardRendererFunction="renderResponsiveCard">
            <Columns>
                <f:RenderField ColumnID="UserProfile" Width="250" RendererFunction="renderUserProfile" HeaderText="基本信息"></f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField Width="150px" ColumnID="Rate1" DataField="Rate1" FieldType="Int" HeaderText="评分" RendererFunction="renderRate1" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" />
                <f:RenderField ColumnID="Status" DataField="Status" RendererFunction="renderStatus" HeaderText="状态" />
            </Columns>
        </f:Grid>
        <br />
        注：缩放浏览器窗口：屏幕宽度小于 992px（中屏以下）时，表格自动切换为卡片模式；否则显示为普通表格。通过 ResponsiveCardSize="MD" 实现，由屏幕尺寸主导显示模式。
    </form>
    <script src="../res/js/grid.js"></script>
    <script src="../res/js/responsive_card.js"></script>
</body>
</html>
