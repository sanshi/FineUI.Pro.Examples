<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accordion_tools.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.accordion.accordion_tools" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-tool.mybadge {
            opacity: 1.0;
            filter: alpha(opacity=100);
        }

        .f-tool.mybadge .f-tool-text {
            padding: 0 4px;
            color: #fff;
            text-align: center;
            white-space: nowrap;
            background-color: #d15b47;
            font-size: 14px;
            border-radius: 12px;
            min-width: 24px;
        }


        .f-tool.mybadge-sub {
            opacity: 0.7;
            filter: alpha(opacity=70);
        }
        .f-tool.mybadge-sub .f-tool-text {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Accordion1" runat="server" />
        <f:Accordion ID="Accordion1" runat="server" ShowHeader="false" ShowBorder="false" 
            ActivePaneIndex="1" ShowCollapseTool="false">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Title="手风琴控件" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Panes>
                <f:AccordionPane ID="AccordionPane1" runat="server" Title="面板一" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Tools>
                        <f:Tool ID="ToolExample1" runat="server" CssClass="mybadge" Text="30"></f:Tool>
                    </Tools>
                    <Items>
                        <f:Label ID="Label1" Text="面板一中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane2" runat="server" Title="面板二（列表）" IconUrl="~/res/images/16/4.png"
                    Layout="Fit">
                    <Tools>
                        <f:Tool ID="Tool1" runat="server" CssClass="mybadge" Text="30/260"></f:Tool>
                    </Tools>
                    <Items>
                        <f:DataList runat="server" ID="DataList1">
                            <f:DataListItem Text="列表项1" Value="item1" />
                            <f:DataListItem Text="列表项2" Value="item2" />
                            <f:DataListItem Text="列表项3" Value="item3" />
                            <f:DataListItem Text="列表项4" Value="item4" />
                            <f:DataListItem Text="列表项5" Value="item5" />
                        </f:DataList>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane3" runat="server" Title="面板三（IFrame）" IconUrl="~/res/images/16/7.png"
                    EnableIFrame="true" IFrameUrl="~/mobile/button/button.aspx">
                    <Tools>
                        <f:Tool ID="Tool3" runat="server" CssClass="mybadge-sub" Text="简单的文字描述"></f:Tool>
                        <f:Tool ID="Tool2" runat="server" CssClass="mybadge" Text="30/150"></f:Tool>
                    </Tools>
                </f:AccordionPane>
            </Panes>
        </f:Accordion>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在移动手风琴标题中显示数字徽标和简短说明，并分别设置它们的外观。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>切换面板并对照标题标记</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴">手风琴</strong>依次点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("AccordionPane1").ClientID %>' title="面板一">面板一</strong>、面板二和面板三标题。<br />结果：对应内容展开；标题中的 <code>30</code>、<code>30/260</code> 等数字徽标和简短说明保留各自样式，文字标记本身没有配置业务点击动作。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Tools</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("AccordionPane1").ClientID %>' title="面板一">面板一</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("AccordionPane2").ClientID %>' title="面板二（列表）">面板二（列表）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("AccordionPane3").ClientID %>' title="面板三（IFrame）">面板三（IFrame）</strong>）：在各面板标题中放置数字或说明工具。</li>
        <li><code>Text</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ToolExample1").ClientID %>' title="第 1 个标题工具">第 1 个标题工具</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tool1").ClientID %>' title="第 2 个标题工具">第 2 个标题工具</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tool3").ClientID %>' title="第 3 个标题工具">第 3 个标题工具</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tool2").ClientID %>' title="第 4 个标题工具">第 4 个标题工具</strong>）：各组分别设为<code>30</code>、<code>30/260</code>、<code>简单的文字描述</code>、<code>30/150</code>，提供本页数字或简短说明。</li>
        <li><code>CssClass</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ToolExample1").ClientID %>' title="第 1 个标题工具">第 1 个标题工具</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tool1").ClientID %>' title="第 2 个标题工具">第 2 个标题工具</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tool3").ClientID %>' title="第 3 个标题工具">第 3 个标题工具</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tool2").ClientID %>' title="第 4 个标题工具">第 4 个标题工具</strong>）：各组分别设为<code>mybadge</code>、<code>mybadge-sub</code>，分别使用 <code>mybadge</code> 与 <code>mybadge</code>-<code>sub</code> 显示徽标和淡色说明。</li>
    </ul>
</section>
</template>
</body>
</html>
