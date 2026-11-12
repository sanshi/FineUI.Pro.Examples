<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_responsive.aspx.cs" Inherits="FineUI.Pro.Examples.block.grid_responsive" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/res/css/responsive-card.css;~/res/js/grid.js;~/res/js/responsive-card.js" />
    <%-- 将资源表达式放在独立容器内，保持 head 可追加控件，确保 FineUI 能插入公共脚本和样式。 --%>
    <asp:PlaceHolder runat="server">

        <link href="<%= PageContext.ResolveUrl("~/res/css/responsive-card.css") %>" rel="stylesheet" />
        <style>
        </style>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" IsFluid="true" CssClass="responsive-card-grid" ShowBorder="true" ShowHeader="true" Title="表格" runat="server" EnableCollapse="false"
            DataIDField="Id" DataAttributeFields="Name,Gender,Avatar,EntranceYear,Status,Desc" ResponsiveCardSize="MD"
            CardRendererFunction="renderResponsiveCard">
            <Columns>
                <f:RenderField ColumnID="UserProfile" Width="250" RendererFunction="renderUserProfile" HeaderText="基本信息"></f:RenderField>
                <f:RenderCheckField ColumnID="AtSchool" DataField="AtSchool" RenderAsStaticField="true" HeaderText="是否在校" />
                <f:RenderField Width="150px" ColumnID="Rate1" DataField="Rate1" FieldType="Int" HeaderText="评分" RendererFunction="renderRate1" />
                <f:RenderField ColumnID="Major" DataField="Major" RendererFunction="renderMajor" ExpandUnusedSpace="true" MinWidth="150px" HeaderText="所学专业" />
                <f:RenderField ColumnID="Status" DataField="Status" RendererFunction="renderStatus" HeaderText="状态" />
            </Columns>
        </f:Grid>
        <br />

    </form>
    <script src="<%= PageContext.ResolveUrl("~/res/js/grid.js") %>"></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/responsive-card.js") %>"></script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示同一份表格数据在较宽屏幕使用表格，在较窄屏幕改为卡片展示。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>切换表格与卡片视图</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>选择一项，再把浏览器从桌面宽度缩到手机宽度。<br />结果：同一数据改为本页定义的卡片内容；选择状态与业务记录标识对应，不因视图切换重复创建业务数据。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>缩放浏览器窗口：屏幕宽度小于 <code>992px</code>（中屏以下）时，表格自动切换为卡片模式；否则显示为普通表格。通过 <code>ResponsiveCardSize</code>="<code>MD</code>" 实现，由屏幕尺寸主导显示模式。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>ResponsiveCardSize</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：指定切换为卡片视图的响应尺寸。 本页使用<code>MD</code>。</li>
        <li><code>CardRendererFunction</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：使用本页客户端函数渲染卡片中的姓名、状态等内容。 本页使用<code>renderResponsiveCard</code>。</li>
        <li><code>DataIDField</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：使用数据中的稳定行标识对应当前选择。 本页使用<code>Id</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
