<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_scrollbar_autoheight.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox_scrollbar_autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel5" IsFluid="true" runat="server" ShowBorder="true" EnableCollapse="false" Layout="HBox" AutoScroll="true" ShowHeader="true"
            Title="面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条" BoxConfigSpace="5" BodyPadding="5">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" Width="600px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Width=600">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" Title="面板2" BoxFlex="1" MinWidth="600px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="BoxFlex=1 末项无额外间隔 MinWidth=600">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <br />
        <br />


    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示组合横向滚动与内容自然高度。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条">面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条</strong>中缩窄容器并横向滚动，对照较高子项。<br />结果：子项宽度保持，横向溢出可滚动；内容高度按本页自动高度设置计算。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>反复缩小页面宽度，使得面板出现横向滚动条，此时面板的高度应保持不变。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条">面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条</strong>）：初始为<code>HBox</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。</li>
        <li><code>AutoScroll</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条">面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条</strong>）：初始为<code>true</code>，内容超出该容器时允许滚动查看。</li>
        <li><code>Height</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条">面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条</strong>）：显式高度限定可用区域；未设置固定高度的对照组按内容和父布局计算。</li>
    </ul>
</section>
</template>
</body>
</html>
