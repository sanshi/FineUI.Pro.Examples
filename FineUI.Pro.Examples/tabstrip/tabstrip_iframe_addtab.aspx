<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_iframe_addtab.aspx.cs"
    Inherits="FineUI.Pro.Examples.tabstrip.tabstrip_iframe_addtab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" IsFluid="true" Height="500px" ShowBorder="true" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab ID="TabExample1" ClientIDMode="Static" Title="FineUI官网" EnableIFrame="true" IFrameUrl="https://fineui.com/" runat="server">
                </f:Tab>
            </Tabs>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="Button1" runat="server" Text="打开DeepSeek官网（tab1_iframe）" OnClick="Button1_Click"></f:Button>
                        <f:Button ID="Button2" runat="server" Text="打开ASP.NET官网（tab1_iframe）" OnClick="Button2_Click"></f:Button>
                        <f:Button ID="Button3" runat="server" Text="打开FineUI官网（tab2_iframe）" OnClick="Button3_Click"></f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:TabStrip>
        <br />
        <br />

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示后台按固定 <code>ID</code> 添加或更新 <code>iframe</code> 标签，重复使用同一标签显示不同页面。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>复用和新增标签</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="打开DeepSeek官网（tab1_iframe）">打开DeepSeek官网（tab1_iframe）</strong>。<br />结果：后台添加并激活第一个动态 <code>iframe</code> 标签。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="打开ASP.NET官网（tab1_iframe）">打开ASP.NET官网（tab1_iframe）</strong>。<br />结果：后台使用相同标签 <code>ID</code> 更新标题和地址，不重复创建另一个同名标签。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button3").ClientID %>' title="打开FineUI官网（tab2_iframe）">打开FineUI官网（tab2_iframe）</strong>。<br />结果：后台使用另一标签 <code>ID</code> 打开新标签，原标签继续保留。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
    <ul>
        <li>由于设置了相同的<code>tabID</code>，<code>FineUI.Pro</code>示例和<code>FineUI</code>示例在同一个选项卡中打开。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>AddTab()</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabStrip1").ClientID %>' title="选项卡">选项卡</strong>）：相同 <code>ID</code> 对应同一个逻辑标签，新增和更新由本页后台代码区分。</li>
        <li><code>IFrameUrl</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("TabExample1").ClientID %>' title="FineUI官网">FineUI官网</strong>）：初始为<code>https://fineui.com/</code>，更新标签中实际打开的页面地址。</li>
    </ul>
</section>
</template>
</body>
</html>
