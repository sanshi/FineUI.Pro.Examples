<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_buttonplain.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.window.window_buttonplain" %>

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
        <f:Window runat="server" ID="Window1" Title="登录窗体" TitleAlign="Center" Hidden="true" IsModal="true" EnableClose="false" Layout="Fit" BodyPadding="15px"
            Width="300px">
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" ShowHeader="false" Layout="VBox" MessageTarget="None">
                    <Items>
                        <f:TextBox ID="tbxUserName" Label="用户名" ShowLabel="false" EmptyText="请输入用户名" Required="true" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" ShowLabel="false" TextMode="Password" EmptyText="请输入密码" Required="true" runat="server">
                        </f:TextBox>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" CssClass="f-toolbar-buttonplain" Position="Bottom" Layout="Fit">
                    <Items>
                        <f:ButtonGroup ID="ButtonGroup1" Layout="HBox" runat="server">
                            <Items>
                                <f:Button ID="btnCancel" runat="server" Text="取消" BoxFlex="1" ClickHandler="onCancelClick"></f:Button>
                                <f:Button ID="btnLogin" Text="登录" Type="Submit" BoxFlex="1" ValidateForms="Window1" ValidateMessageBoxPlain="true"
                                    runat="server" OnClick="btnLogin_Click">
                                </f:Button>
                            </Items>
                        </f:ButtonGroup>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>
    <script>
        var window1ClientID = '<%= Window1.ClientID %>';

        function onCancelClick(event) {
            F(window1ClientID).hide();
        }

        function onOpenWindowClick(event) {
            F(window1ClientID).show();

        }

    </script>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示移动窗体底部的简洁双按钮工具栏，用取消入口关闭不带关闭图标的窗体。</p>
    <h3><i class="f-iconfont f-iconfont-window" aria-hidden="true"></i>对照底部按钮并取消</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnOpenWindow").ClientID %>' title="打开登录窗体">打开登录窗体</strong>。<br />结果：窗体出现，底部取消与登录等宽排列，标题栏不显示关闭图标。</li>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnCancel").ClientID %>' title="取消">取消</strong>。<br />结果：浏览器隐藏窗体，不提交登录；再次打开仍能继续使用。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>CssClass</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Toolbar1").ClientID %>' title="工具栏">工具栏</strong>）：设为<code>f-toolbar-buttonplain</code>，底部工具栏使用 <code>f</code>-<code>toolbar</code>-<code>buttonplain</code> 简洁按钮样式。</li>
        <li><code>BoxFlex</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnCancel").ClientID %>' title="取消">取消</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLogin").ClientID %>' title="登录">登录</strong>）：设为<code>1</code>，底部两个按钮等分可用宽度。</li>
        <li><code>EnableClose</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("Window1").ClientID %>' title="登录窗体">登录窗体</strong>）：设为<code>false</code>，窗体设为 <code>false</code>，改由本页取消按钮关闭。</li>
    </ul>
</section>
</template>
</body>
</html>
