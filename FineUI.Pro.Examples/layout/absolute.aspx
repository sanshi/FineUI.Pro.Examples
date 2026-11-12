<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="absolute.aspx.cs" Inherits="FineUI.Pro.Examples.layout.absolute" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel2" IsFluid="true" runat="server" Height="500px" ShowBorder="true" EnableCollapse="false"
            Layout="Absolute" ShowHeader="true" Title="面板（Height=450px Width=750px Layout=Absolute）">
            <Items>
                <f:Panel ID="Panel1" Width="300px" Title="Panel1" Height="300px" AbsoluteX="100px"
                    BodyPadding="10px" AbsoluteY="50px" runat="server"
                    ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" EncodeText="false" Text="Width=300px <br/>Height=300px <br/>AbsoluteX=100px <br/>AbsoluteY=50px"
                            runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" Title="Panel2" Width="150px" Height="150px" AbsoluteX="450px"
                    BodyPadding="10px" AbsoluteY="150px" runat="server"
                    ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" EncodeText="false" Text="Width=150px <br/>Height=150px <br/>AbsoluteX=450px <br/>AbsoluteY=150px"
                            runat="server">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示通过明确的横、纵坐标把子面板放在父容器的指定位置。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照坐标与面板位置</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（Height=450px Width=750px Layout=Absolute）">面板（Height=450px Width=750px Layout=Absolute）</strong>对照两个子面板距左、上边缘的位置。<br />结果：两个子面板分别从本页设定的坐标开始显示，不按普通文档流接到上一面板后面。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel2").ClientID %>' title="面板（Height=450px Width=750px Layout=Absolute）">面板（Height=450px Width=750px Layout=Absolute）</strong>）：初始为<code>Absolute</code>，父容器使用 <code>Absolute</code> 布局。</li>
        <li><code>AbsoluteX</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="Panel1">Panel1</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel3").ClientID %>' title="Panel2">Panel2</strong>）：各组分别设为<code>100px</code>、<code>450px</code>，本页两个子项分别距父容器左侧 <code>100</code> 与 <code>450</code> 像素。</li>
        <li><code>AbsoluteY</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="Panel1">Panel1</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel3").ClientID %>' title="Panel2">Panel2</strong>）：各组分别设为<code>50px</code>、<code>150px</code>，本页两个子项分别距父容器顶部 <code>50</code> 与 <code>150</code> 像素。</li>
    </ul>
</section>
</template>
</body>
</html>
