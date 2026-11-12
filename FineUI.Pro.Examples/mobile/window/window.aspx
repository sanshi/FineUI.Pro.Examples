<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxConfigSpace="5" BodyPadding="10px" runat="server">
            <Items>
                <f:Button runat="server" ID="btnOpenWindow" Text="打开登录窗体" ClickHandler="onOpenWindowClick"></f:Button>
            </Items>
        </f:Panel>
        <f:Window runat="server" ID="Window1" Title="登录窗体" Hidden="true" IsModal="true" EnableClose="true" Layout="Fit" BodyPadding="15px" Width="300px">
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" ShowHeader="false" Layout="VBox" MessageTarget="None">
                    <Items>
                        <f:TextBox ID="tbxUserName" Label="用户名" ShowLabel="false" EmptyText="请输入用户名" Required="true" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" ShowLabel="false" TextMode="Password" EmptyText="请输入密码" Required="true" runat="server">
                        </f:TextBox>
                        <f:Button ID="btnLogin" Text="登录" Type="Submit" BoxFlex="1" ValidateForms="Window1" ValidateMessageBoxPlain="true" runat="server"
                            OnClick="btnLogin_Click">
                        </f:Button>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Window>
    </form>
    <script>
        var window1ClientID = '<%= Window1.ClientID %>';

        function onCancelClick() {
            F(window1ClientID).hide();
        }

        function onOpenWindowClick(event) {
            F(window1ClientID).show();

        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示打开移动模态登录窗体，在遮罩上方完成字段验证和示例登录。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-window" aria-hidden="true"></i>在窗体内验证并登录</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOpenWindow").ClientID %>' title="打开登录窗体">打开登录窗体</strong>。<br />结果：浏览器显示登录窗体和遮罩，背景页面暂时不能操作。</li>
        <li>在窗体内先留空字段点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLogin").ClientID %>' title="登录">登录</strong>，再把用户名和密码都填为<code>admin</code>后登录。<br />结果：空值先由浏览器阻止；有效输入才回发，后台按本页示例账号比对并显示结果，不代表建立了真实认证会话。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>IsModal</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="登录窗体">登录窗体</strong>）：初始为<code>true</code>，登录窗体显示遮罩，限制背景交互。</li>
        <li><code>ValidateForms</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLogin").ClientID %>' title="登录">登录</strong>）：初始为<code>Window1</code>，登录前验证本页窗体内的字段。</li>
        <li><code>ValidateMessageBoxPlain</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLogin").ClientID %>' title="登录">登录</strong>）：初始为<code>true</code>，验证错误使用本页简洁提示框样式。</li>
    </ul>
</section>
</template>
</body>
</html>
