<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hello.aspx.cs" Inherits="FineUI.Pro.Examples.basic.hello" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="点击弹出对话框" runat="server" ID="btnHello" OnClick="btnHello_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="在顶层窗口弹出对话框" runat="server" ID="btnHello2" OnClick="btnHello2_Click">
        </f:Button>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>通过两个按钮对照在当前页面和顶层页面显示提示对话框的效果。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>对照弹出位置</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello").ClientID %>' title="点击弹出对话框">点击弹出对话框</strong>。<br />结果：按钮回发后，后台显示当前示例中的提示框，遮罩范围限于本页。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello2").ClientID %>' title="在顶层窗口弹出对话框">在顶层窗口弹出对话框</strong>。<br />结果：按钮回发后，后台显示顶层提示框，遮罩覆盖框架页。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Target</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnHello").ClientID %>' title="点击弹出对话框">点击弹出对话框</strong>）：对话框使用当前页面或顶层页面作为显示范围；从框架打开示例时更容易比较。</li>
    </ul>
</section>
</template>
</body>
</html>
