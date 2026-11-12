<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aspnet.aspx.cs" Inherits="FineUI.Pro.Examples.aspnet.aspnet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .marginb {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AjaxAspnetControls="aspBox" runat="server" />
        <f:ContentPanel ID="ContentPanel1" IsFluid="true" runat="server" BodyPadding="10px"
            ShowBorder="true" ShowHeader="true" Title="内容面板">
            <f:TextBox runat="server" Width="300px" ID="extBox" EmptyText="FineUI TextBox">
            </f:TextBox>
            <div class="marginb">
                <asp:TextBox runat="server" Width="300px" ID="aspBox"></asp:TextBox>
            </div>
            <div class="marginb">
                <f:Button ID="Button1" runat="server" CssClass="marginr" Text="FineUI 按钮"
                    OnClick="Button1_Click">
                </f:Button>
            </div>
            <div class="marginb">
                <f:Button ID="Button2" runat="server" Text="FineUI 按钮（禁用AJAX）" EnableAjax="false" OnClick="Button2_Click">
                </f:Button>
            </div>
            <div>
                <asp:Button ID="Button3" Text="ASP.NET 按钮（UseSubmitBehavior=false）" runat="server" OnClick="Button3_Click" UseSubmitBehavior="false" />
            </div>
        </f:ContentPanel>
        <br />
        注意：ASP.NET 按钮必须设置属性 UseSubmitBehavior=false，否则会出现未知错误！
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>在同一页面混用 ASP.NET 与 FineUI 输入控件，比较 AJAX 和整页提交的更新方式。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-refresh" aria-hidden="true"></i>分别提交两种按钮</h3>
    <ul>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button1").ClientID %>' title="FineUI 按钮">FineUI 按钮</strong>。<br />结果：AJAX 回发更新已登记的 ASP.NET 输入和 FineUI 输入，两者显示本次后台写入的时间。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="FineUI 按钮（禁用AJAX）">FineUI 按钮（禁用AJAX）</strong>。<br />结果：执行整页提交后，两种输入框都显示后台写入的时间文字。</li>
    </ul>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>EnableAjax</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Button2").ClientID %>' title="FineUI 按钮（禁用AJAX）">FineUI 按钮（禁用AJAX）</strong>）：初始为 <code>false</code>，控制按钮采用 AJAX 回发还是整页提交。</li>
        <li><code>AjaxAspnetControls</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("ContentPanel1").ClientID %>' title="内容面板">内容面板</strong>）：需要局部更新的 ASP.NET 控件由 PageManager 登记，FineUI 控件使用自己的更新机制。</li>
    </ul>
</section>
</template>
</body>
</html>
