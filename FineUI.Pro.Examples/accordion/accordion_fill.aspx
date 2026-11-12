<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accordion_fill.aspx.cs" Inherits="FineUI.Pro.Examples.accordion.accordion_fill" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Accordion ID="Accordion1" IsFluid="true" Title="手风琴控件（禁用填充）" ShowHeader="false" runat="server" Height="500px"
            EnableFill="false" ShowBorder="true" ActivePaneIndex="1" EnableCollapse="false">
            <Panes>
                <f:AccordionPane ID="AccordionPane1" runat="server" Title="面板一" IconUrl="~/res/images/16/1.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label1" Text="面板一中的文本" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane2" runat="server" Title="面板二" IconUrl="~/res/images/16/4.png"
                    BodyPadding="2px 5px">
                    <Items>
                        <f:Label ID="Label2" Text="面板二中的文本<br/>balabala<br/>balabala<br/>balabala<br/>balabala" EncodeText="false" runat="server">
                        </f:Label>
                    </Items>
                </f:AccordionPane>
                <f:AccordionPane ID="AccordionPane3" runat="server" Title="面板三" IconUrl="~/res/images/16/7.png"
                    BodyPadding="2px 5px">
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
    <p>演示手风琴面板按内容自然高度展开，并允许把所有面板都收起。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>比较自然高度与全部折叠</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴控件（禁用填充）">手风琴控件（禁用填充）</strong>先展开面板二，再点击它的标题。<br />结果：面板按内容高度显示；再次点击可收起当前面板，不强制保留一个展开项。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="获取当前展开的面板">获取当前展开的面板</strong>。<br />结果：全部折叠时显示没有面板处于展开状态的提示。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableFill</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴控件（禁用填充）">手风琴控件（禁用填充）</strong>）：初始为<code>false</code>，展开面板不再填满容器剩余高度。</li>
        <li><code>ActivePaneIndex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Accordion1").ClientID %>' title="手风琴控件（禁用填充）">手风琴控件（禁用填充）</strong>）：初始为<code>1</code>，全部折叠时表示没有当前面板，不能按正常位置直接取内容。</li>
    </ul>
</section>
</template>
</body>
</html>
