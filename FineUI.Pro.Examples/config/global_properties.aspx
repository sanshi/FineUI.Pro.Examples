<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="global_properties.aspx.cs" Inherits="FineUI.Pro.Examples.config.global_properties" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>全局配置属性</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="sourcefiles" content="~/res/js/global-properties.js" />
    <style>
        .config-property-detail {
            box-sizing: border-box;
            max-width: min(76ch, calc(100vw - 6rem));
            white-space: normal;
            overflow-wrap: anywhere;
        }

        .config-property-detail pre {
            white-space: pre-wrap;
        }
    </style>
</head>
<body class="f-body-darkerbg">
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid runat="server" ID="Grid1" IsFluid="true" ShowBorder="true" CssClass="f-panel-border-shadow" ShowHeader="true" Title="全局配置属性"
                DataIDField="name" DataTextField="name" AllowPaging="true" PageSize="100"
                EnableTextSelection="true" EnableMultiSelect="false" EnableCheckBoxSelect="false"
                EmptyText="未找到匹配的配置项，可缩短关键词或清除筛选条件。">
            <Toolbars>
                <f:Toolbar runat="server" ID="ToolbarFilters" Position="Top" Layout="HBox" BoxConfigSpace="10" BodyPadding="5">
                    <Items>
                        <f:DropDownList runat="server" ID="ddlCategory" Label="配置分类" LabelAlign="Top" BoxFlex="2"
                                EmptyText="全部分类" AutoSelectFirstItem="false" AutoShowClearIcon="true">
                            <Listeners>
                                <f:Listener runat="server" Event="change" Handler="onConfigQueryChange" />
                            </Listeners>
                        </f:DropDownList>
                        <f:TriggerBox runat="server" ID="tbxSearch" Label="搜索配置项" LabelAlign="Top" BoxFlex="3"
                                EmptyText="名称、含义或可选值" TriggerIcon="Clear" AutoShowClearIcon="true">
                            <Listeners>
                                <f:Listener runat="server" Event="change" Handler="onConfigQueryChange" />
                            </Listeners>
                        </f:TriggerBox>
                    </Items>
                </f:Toolbar>
                <f:Toolbar runat="server" ID="ToolbarOptions" Position="Top">
                    <Items>
                        <f:ToolbarFill runat="server" />
                        <f:Label runat="server" ID="labResultCount" ShowLabel="false" />
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RenderField runat="server" DataField="name" RenderAsRowExpander="true"
                        ExpandOnDblClick="false" RendererFunction="ConfigPropertyQuery.renderDetail" />
                <f:RenderField runat="server" ColumnID="name" HeaderText="配置名称" DataField="name" Width="234" RendererFunction="ConfigPropertyQuery.renderName" />
                <f:RenderField runat="server" ColumnID="description" HeaderText="含义" DataField="description" ExpandUnusedSpace="true" MinWidth="220" />
                <f:RenderField runat="server" ColumnID="initialText" HeaderText="初始值" DataField="initialText" Width="140" />
                <f:RenderField runat="server" ColumnID="options" HeaderText="可选值或格式" DataField="options" Width="245" />
            </Columns>
            <Listeners>
                <f:Listener runat="server" Event="rowclick" Handler="onConfigRowClick" />
                <f:Listener runat="server" Event="rowexpanderexpand" Handler="onConfigRowExpand" />
                <f:Listener runat="server" Event="rowexpandercollapse" Handler="onConfigRowCollapse" />
            </Listeners>
        </f:Grid>


    </form>
    <script type="application/json" id="configPropertyCatalog" data-format="xml" data-example-label="Web.config 属性写法"
            data-grid="<%= Grid1.ClientID %>" data-category="<%= ddlCategory.ClientID %>" data-search="<%= tbxSearch.ClientID %>" data-count="<%= labResultCount.ClientID %>"><%= CatalogJson %></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/global-properties.js") %>"></script>
<template id="example-description">
<section aria-label="页面描述">
    <p>按分类和关键词查阅本端全局配置的含义、默认值、可选值及配置文件写法。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>筛选并查看详情</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxSearch").ClientID %>' title="搜索配置项">搜索配置项</strong>输入 <code>Theme</code>。<br />结果：列表仅保留匹配项，结果数量随之更新。</li>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlCategory").ClientID %>' title="配置分类">配置分类</strong>选择一个分类或控件，再点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="全局配置属性">全局配置属性</strong>中的属性名。<br />结果：分类与关键词组合过滤，详情展示该项的使用条件和本端代码。</li>
        <li>使用输入框的清除图标清除条件。<br />结果：恢复较完整的属性清单；查询操作本身不会更改网站配置。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <p>初始值取自 FineUI.Pro 的空配置。点击名称或左侧加号可查看完整取值和使用条件。示例属性写在 Web.config 的 <code>&lt;FineUI.Pro /&gt;</code> 节点上。</p>
    <p>配置节注册和完整示例见<a href="modify_webconfig.aspx">配置 Web.config</a>。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EmptyText</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="全局配置属性">全局配置属性</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlCategory").ClientID %>' title="配置分类">配置分类</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxSearch").ClientID %>' title="搜索配置项">搜索配置项</strong>）：初始为 <code>未找到匹配的配置项，可缩短关键词或清除筛选条件。</code>、<code>全部分类</code>、<code>名称、含义或可选值</code>，为空时显示输入提示；表格无记录时显示对应空结果文字。</li>
        <li><code>AutoSelectFirstItem</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlCategory").ClientID %>' title="配置分类">配置分类</strong>）：初始为 <code>false</code>，控制未显式选择时是否自动选中第一项。</li>
        <li><code>AutoShowClearIcon</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ddlCategory").ClientID %>' title="配置分类">配置分类</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxSearch").ClientID %>' title="搜索配置项">搜索配置项</strong>）：初始为 <code>true</code>，有值时显示清除图标，便于移除筛选条件。</li>
        <li><code>默认值与可选值</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Grid1").ClientID %>' title="全局配置属性">全局配置属性</strong>）：清单展示产品默认配置，区别于示例站当前覆盖后的设置。</li>
    </ul>
</section>
</template>
</body>
</html>
