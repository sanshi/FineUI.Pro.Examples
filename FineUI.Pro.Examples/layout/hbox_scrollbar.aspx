<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_scrollbar.aspx.cs" Inherits="FineUI.Pro.Examples.layout.hbox_scrollbar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel5" runat="server" />
        <f:Panel ID="Panel5" Margin="24px" runat="server" ShowBorder="true" EnableCollapse="false" Layout="HBox" AutoScroll="true" ShowHeader="true"
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

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在水平子项总宽度超过容器时显示横向滚动条。</p>
    <h3><i class="f-iconfont f-iconfont-layout" aria-hidden="true"></i>对照布局与尺寸变化</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条">面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条</strong>中缩小浏览器宽度，再拖动横向滚动条。<br />结果：各子项保留本页宽度，超出的右侧项目可通过横向滚动查看。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Layout</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条">面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条</strong>）：设为<code>HBox</code>，父容器使用本页对应的布局方式，决定其直接子项的排列。</li>
        <li><code>AutoScroll</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel5").ClientID %>' title="面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条">面板（Layout=HBox AutoScroll=true），宽度变小时可能出现横向滚动条</strong>）：设为<code>true</code>，内容超出该容器时允许滚动查看。</li>
        <li><code>Width</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Panel1").ClientID %>' title="面板1">面板1</strong>）：设为<code>600px</code>，指定本页子项或外层容器的宽度。</li>
    </ul>
</section>
</template>
</body>
</html>
