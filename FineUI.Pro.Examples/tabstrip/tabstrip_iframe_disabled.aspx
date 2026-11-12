<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_iframe_disabled.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_iframe_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/tabstrip/tabstrip_iframe_disabled_tab1.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" ShowBorder="true" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" runat="server" EnableIFrame="true" IFrameUrl="./tabstrip_iframe_disabled_tab1.aspx">
                </f:Tab>
                <f:Tab ID="Tab2" EnableIFrame="true" BodyPadding="10px" Enabled="false" IFrameUrl="../panel/panel_group.aspx"
                    Title="标签二" runat="server">
                </f:Tab>
                <f:Tab ID="Tab3" EnableIFrame="true" BodyPadding="10px" Enabled="false" IFrameUrl="../panel/panel.aspx"
                    Title="标签三" runat="server">
                </f:Tab>
            </Tabs>
        </f:TabStrip>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示先禁用外部标签，再由 <code>iframe</code> 内的页面启用指定标签。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>从子页面启用标签</h3>
    <ol>
        <li>初次打开时尝试点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>中的第二、第三个标签。<br />结果：禁用标签不会被激活，当前页面继续保留。</li>
        <li>在第一个标签的 <code>iframe</code> 内点击启用目标标签的按钮，再点击对应标题。<br />结果：子页面通过父页面中的控件实例启用目标标签，随后可以正常切页。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Enabled</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab2").ClientID %>' title="标签二">标签二</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab3").ClientID %>' title="标签三">标签三</strong>）：第二、第三个标签初始为 <code>false</code>；由子页面更新后可用。 本页使用<code>false</code>。</li>
        <li><code>EnableIFrame</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab1").ClientID %>' title="标签一">标签一</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab2").ClientID %>' title="标签二">标签二</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab3").ClientID %>' title="标签三">标签三</strong>）：在标签中加载用于操作父页面的子页面。 本页使用<code>true</code>。</li>
    </ul>
</section>
</template>
</body>
</html>
