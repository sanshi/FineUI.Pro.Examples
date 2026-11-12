<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hello_aspnet.aspx.cs" Inherits="FineUI.Pro.Examples.basic.hello_aspnet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <asp:Button Text="点击弹出对话框" runat="server" ID="btnHello" OnClick="btnHello_Click" />
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>用原生 ASP.NET Button 触发后台事件，再调用 FineUI 显示提示对话框。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>由原生按钮调用提示框</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control="btnHello" title="点击弹出对话框">点击弹出对话框</strong>。<br />结果：ASP.NET 按钮提交到后台，后台显示 FineUI 提示框。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>OnClick</code>（<strong class="example-control-reference" data-example-control="btnHello" title="点击弹出对话框">点击弹出对话框</strong>）：事件属于 ASP.NET Button，提示框由后台 FineUI API 创建。</li>
    </ul>
</section>
</template>
</body>
</html>
