<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_scrollbar.aspx.cs" Inherits="FineUI.Pro.Examples.layout.vbox_scrollbar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel5" runat="server" />
        <f:Panel ID="Panel5" Margin="24px" runat="server" ShowBorder="true" EnableCollapse="true" Layout="VBox" AutoScroll="true" ShowHeader="true"
            Title="面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条" BoxConfigSpace="5" BodyPadding="5">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" Height="300px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Height=300">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" Title="面板2" BoxFlex="1" MinHeight="300px" runat="server" BodyPadding="10px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="BoxFlex=1 末项无额外间隔 MinHeight=300">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在纵向内容超过可用高度时滚动查看。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条">面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条</strong>中缩小浏览器高度，再向下滚动内容区域。<br />结果：各子项保留自身尺寸，超出部分通过容器纵向滚动查看。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条">面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条</strong>）：设为<code>VBox</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。</li>
        <li><code>AutoScroll</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条">面板（Layout=VBox AutoScroll=true），高度变小时可能出现纵向滚动条</strong>）：设为<code>true</code>，内容超出该容器时允许滚动查看。</li>
        <li><code>Height</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板1">面板1</strong>）：设为<code>300px</code>，显式高度限定可用区域；未设置固定高度的对照组按内容和父布局计算。</li>
    </ul>
</section>
</template>
</body>
</html>
