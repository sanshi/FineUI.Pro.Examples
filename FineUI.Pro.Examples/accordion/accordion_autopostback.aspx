<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accordion_autopostback.aspx.cs" Inherits="FineUI.Pro.Examples.accordion.accordion_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Accordion ID="Accordion1" IsFluid="true" Title="手风琴控件" ShowHeader="false" runat="server" Height="500px" ShowBorder="true" ActivePaneIndex="1"
            OnPaneIndexChanged="Accordion1_PaneIndexChanged" EnableCollapse="false">
            <Panes>
                <f:AccordionPane ID="AccordionPane1" runat="server" Title="面板一" IconUrl="~/res/images/16/1.png" BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label1" Text="面板一中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane2" runat="server" Title="面板二" IconUrl="~/res/images/16/4.png" BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label2" Text="面板二中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane3" runat="server" Title="面板三" IconUrl="~/res/images/16/7.png" BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label3" Text="面板三中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
            </Panes>
        </f:Accordion>
        <br />
        <f:Button ID="Button1" Text="获取当前展开的面板" runat="server" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" Text="展开下一个面板" runat="server" OnClick="Button2_Click">
        </f:Button>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示手风琴当前面板改变时回发，并读取变化后的展开位置。</p>
    <h3><i class="f-iconfont f-iconfont-refresh" aria-hidden="true"></i>处理展开面板变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴控件">手风琴控件</strong>从面板二切到面板一。<br />结果：面板改变事件回发，后台显示当前展开面板的编号。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>OnPaneIndexChanged</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴控件">手风琴控件</strong>）：当前展开面板变化时执行，不需要另点读取按钮。</li>
        <li><code>ActivePaneIndex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴控件">手风琴控件</strong>）：用于读取事件发生后的当前面板位置。 本页使用<code>1</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
