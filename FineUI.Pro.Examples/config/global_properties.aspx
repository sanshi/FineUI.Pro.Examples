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
        <p>初始值取自 FineUI.Pro 的空配置。点击名称或左侧加号可查看完整取值和使用条件。示例属性写在 Web.config 的 <code>&lt;FineUI.Pro /&gt;</code> 节点上。</p>
        <p>配置节注册和完整示例见<a href="modify_webconfig.aspx">配置 Web.config</a>。</p>
    </form>
    <script type="application/json" id="configPropertyCatalog" data-format="xml" data-example-label="Web.config 属性写法"
            data-grid="<%= Grid1.ClientID %>" data-category="<%= ddlCategory.ClientID %>" data-search="<%= tbxSearch.ClientID %>" data-count="<%= labResultCount.ClientID %>"><%= CatalogJson %></script>
    <script src="<%= PageContext.ResolveUrl("~/res/js/global-properties.js") %>"></script>
</body>
</html>
