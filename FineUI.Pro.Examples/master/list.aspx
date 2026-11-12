<%@ Page Title="" Language="C#" MasterPageFile="~/master/SingleGrid.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="FineUI.Pro.Examples.master.list" %>

<%@ MasterType VirtualPath="~/master/SingleGrid.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainCPH" runat="server">
    <f:Grid DataIDField="Id" ID="Grid1" EnableCollapse="false" PageSize="5" ShowBorder="false" ShowHeader="false" BoxFlex="1" AllowPaging="true"
        IsDatabasePaging="true" runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name" AllowSorting="true" SortField="Name" SortDirection="ASC">
        <Columns>
            <f:RowNumberField />
            <f:RenderField DataField="Name" SortField="Name" HeaderText="姓名" />
            <f:RenderField ColumnID="Gender" SortField="Gender" HeaderText="性别" DataField="Gender" RendererFunction="renderGender" />
            <f:RenderField SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
            <f:RenderCheckField SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
            <f:RenderField ColumnID="Major" HeaderText="所学专业" ExpandUnusedSpace="true" MinWidth="150px" DataField="Major" RendererFunction="renderMajor" />
            <f:RenderField ColumnID="Group" HeaderText="分组" DataField="Group" RendererFunction="renderGroup" />
        </Columns>
        <Toolbars>
            <f:Toolbar ID="Toolbar1" runat="server">
                <Items>
                    <f:Button ID="btnImport" runat="server" Text="导入数据" OnClick="btnImport_Click"></f:Button>
                    <f:Button ID="btnExport" runat="server" Text="导出数据" OnClick="btnExport_Click"></f:Button>
                </Items>
            </f:Toolbar>
        </Toolbars>
    </f:Grid>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="headCPH">
    <meta name="sourcefiles" content="~/master/SingleGrid.Master;~/master/ISingleGridPage.cs" />
<template id="example-description">
<section aria-label="页面描述">
    <p>把可分页、排序的表格内容接入母版布局，母版与内容页通过接口配合。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>验证已实现的列表操作</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>点击下一页或可排序列标题。<br />结果：后台按当前页码或排序条件重新绑定数据。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnImport").ClientID %>' title="导入数据">导入数据</strong>。<br />结果：显示尚未实现提示，本例未提供真实文件导入。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnExport").ClientID %>' title="导出数据">导出数据</strong>。<br />结果：显示尚未实现提示，不生成导出文件。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>AllowPaging</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>true</code>，显示分页入口，按当前页码查看数据。</li>
        <li><code>IsDatabasePaging</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>true</code>，由后台按页提供当前记录，并返回总记录数。</li>
        <li><code>PageSize</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>5</code>，指定每页记录数。</li>
        <li><code>AllowSorting</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="表格">表格</strong>）：初始为 <code>true</code>，允许点击列标题请求排序。</li>
    </ul>
</section>
</template>
</asp:Content>
