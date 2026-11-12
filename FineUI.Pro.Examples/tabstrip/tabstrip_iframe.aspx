<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_iframe.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" ShowBorder="true" ActiveTabIndex="1"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab1" BodyPadding="10px" Title="标签一" runat="server">
                    <Items>
                        <f:Label ID="Label1" Text="文本" runat="server">
                        </f:Label>
                        <f:ContentPanel ID="ContentPanel1" BodyPadding="10px" ShowBorder="true" ShowHeader="true"
                            Title="内容面板" runat="server">
                            这是内容面板中的内容。
                        </f:ContentPanel>
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" EnableIFrame="true" IFrameUrl="../panel/panel_group.aspx"
                    Title="标签二（IFrame）" runat="server">
                    <Listeners>
                        <f:Listener Event="iframeload" Handler="onTab2IFrameLoad" />
                    </Listeners>
                </f:Tab>
                <f:Tab ID="Tab3" EnableIFrame="true" IFrameUrl="../panel/panel.aspx"
                    Title="标签三（IFrame）" runat="server">
                    <Listeners>
                        <f:Listener Event="iframeload" Handler="onTab3IFrameLoad" />
                    </Listeners>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <br />

    </form>
    <script>

        function onTab2IFrameLoad(event) {
            F.notify('标签二中的IFrame加载完毕！');
        }

        function onTab3IFrameLoad(event) {
            F.notify('标签三中的IFrame加载完毕！');
        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示在标签内容中加载 <code>iframe</code>，并在需要显示时加载对应页面。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>切换 iframe 内容</h3>
    <ul>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>切到<code>标签三</code>。<br />结果：该标签的 <code>iframe</code> 加载对应页面；加载完成后执行本页配置的加载事件。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>标签二 和 标签三 中的<code>IFrame</code>加载完毕时，会在右下角显示提示框。</li>
    </ul>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableIFrame</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab2").ClientID %>' title="标签二（IFrame）">标签二（IFrame）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab3").ClientID %>' title="标签三（IFrame）">标签三（IFrame）</strong>）：设为<code>true</code>，为指定标签使用 <code>iframe</code> 内容。</li>
        <li><code>IFrameUrl</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab2").ClientID %>' title="标签二（IFrame）">标签二（IFrame）</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Tab3").ClientID %>' title="标签三（IFrame）">标签三（IFrame）</strong>）：各组分别设为<code>../panel/panel_group.aspx</code>、<code>../panel/panel.aspx</code>，指定各 <code>iframe</code> 标签的初始页面地址。</li>
        <li><code>iframeload</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：目标页面加载完成后执行本页客户端提示。</li>
    </ul>
</section>
</template>
</body>
</html>
