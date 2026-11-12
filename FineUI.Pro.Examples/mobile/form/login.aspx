<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FineUI.Pro.Examples.mobile.form.login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .mypic {
            text-align: center;
        }

        .mypic img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
        }

        .myhyperlinkcontainer {
            text-align: center;
            margin-top: 20px;
        }

        .myhyperlink {
            display: inline-block !important;
            margin-right: 5px;
        }

        .myhyperlink a {
            font-size: 0.8em;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel runat="server" ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="Fit" BodyPadding="20px">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Title="系统登录" HeaderStyle="true">
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" ShowHeader="false" Layout="VBox" MessageTarget="None">
                    <Items>
                        <f:Image runat="server" CssClass="mypic" ImageUrl="~/res/images/my-face-80.jpg"></f:Image>
                        <f:TextBox ID="tbxUserName" Label="用户名" ShowLabel="false" EmptyText="请输入用户名" Required="true" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" ShowLabel="false" TextMode="Password" EmptyText="请输入密码" Required="true" runat="server">
                        </f:TextBox>
                        <f:Button ID="btnLogin" Text="登录" Type="Submit" ValidateForms="SimpleForm1" runat="server" OnClick="btnLogin_Click">
                        </f:Button>
                        <f:Panel runat="server" CssClass="myhyperlinkcontainer" ShowBorder="false" ShowHeader="false">
                            <Items>
                                <f:HyperLink ID="HyperLink1" runat="server" CssClass="myhyperlink" NavigateUrl="http://fineui.com/bbs/" Text="新用户注册">
                                </f:HyperLink>
                                <f:HyperLink ID="HyperLink2" runat="server" CssClass="myhyperlink" NavigateUrl="http://fineui.com/bbs/" Text="忘记密码？">
                                </f:HyperLink>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Panel>

    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>演示移动登录表单的必填验证、密码掩码，以及示例账号的结果提示。</p>
    <h3><i class="f-iconfont f-iconfont-check" aria-hidden="true"></i>先验证，再比对示例账号</h3>
    <ol>
        <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLogin").ClientID %>' title="登录">登录</strong>。<br />结果：空字段先触发浏览器必填验证，不执行账号比对。</li>
        <li>将<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxUserName").ClientID %>' title="用户名">用户名</strong>和<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxPassword").ClientID %>' title="密码">密码</strong>都输入<code>admin</code>，再点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLogin").ClientID %>' title="登录">登录</strong>。<br />结果：验证通过后才回发，后台按本页示例账号比对并显示成功提示；本例未建立真实的认证会话。</li>
        <li>把<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxPassword").ClientID %>' title="密码">密码</strong>改为<code>wrong</code>后再次登录。<br />结果：字段格式可通过，但账号比对显示用户名或密码错误。</li>
    </ol>
    <h3><i class="f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>Required</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxUserName").ClientID %>' title="用户名">用户名</strong>、<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxPassword").ClientID %>' title="密码">密码</strong>）：设为<code>true</code>，用户名和密码均不能为空。</li>
        <li><code>TextMode</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxPassword").ClientID %>' title="密码">密码</strong>）：设为<code>Password</code>，密码字段使用 <code>Password</code>，以掩码显示输入。</li>
        <li><code>ValidateForms</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLogin").ClientID %>' title="登录">登录</strong>）：设为<code>SimpleForm1</code>，登录按钮先验证本页登录表单。</li>
    </ul>
</section>
</template>
</body>
</html>
