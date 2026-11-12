<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accordion.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.accordion.accordion" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Accordion1" runat="server" />
        <f:Accordion ID="Accordion1" runat="server" ShowHeader="false" ShowBorder="false" ActivePaneIndex="1">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Title="手风琴控件" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Panes>
                <f:AccordionPane ID="AccordionPane1" runat="server" Title="面板一" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label1" Text="面板一中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane2" runat="server" Title="面板二（列表）" IconUrl="~/res/images/16/4.png"
                    Layout="Fit">
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
                </f:AccordionPane>
            </Panes>
        </f:Accordion>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示移动手风琴面板的互斥展开和当前内容切换。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-list" aria-hidden="true"></i>切换展开的面板</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴">手风琴</strong>依次点击不同面板标题。<br />结果：新面板展开，之前展开的面板收起，内容仍属于各自面板。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>ActivePaneIndex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴">手风琴</strong>）：初始为<code>1</code>，控制初始展开位置，索引从 <code>0</code> 开始。</li>
        <li><code>EnableFill</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴">手风琴</strong>）：当前展开面板使用手风琴剩余空间。</li>
    </ul>
</section>
</template>
</body>
</html>
