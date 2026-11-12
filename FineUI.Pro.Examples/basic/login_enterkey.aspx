<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_enterkey.aspx.cs" Inherits="FineUI.Pro.Examples.basic.login_enterkey" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        用户名：admin
        <br />
        密码：admin
        <br />
        <br />
        <br />
        注意：在表单内按回车键会导航到下一个控件。
        <f:Window ID="Window1" runat="server" Title="登录表单" IsModal="false" EnableClose="false"
            WindowPosition="GoldenSection" Width="350px">
            <Items>
                <f:SimpleForm ID="SimpleForm1" runat="server" ShowBorder="false" BodyPadding="10px" RemoveLastFieldsMargin="true" ShowHeader="false">
                    <Items>
                        <f:TextBox ID="tbxUserName" Label="用户名" Required="true" ShowRedStar="true" runat="server" NextFocusControl="tbxPassword">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" TextMode="Password" Required="true" ShowRedStar="true" runat="server" NextClickControl="btnLogin">
                        </f:TextBox>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="btnLogin" Text="登录" Type="Button" ValidateForms="SimpleForm1" ValidateTarget="Top" ButtonColor="Primary"
                            runat="server" OnClick="btnLogin_Click">
                        </f:Button>
                        <f:Button ID="btnReset" Text="重置" Type="Reset"
                            runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>
<template id="example-description">
<section aria-label="页面描述">
    <p>用回车键在用户名、密码和登录按钮之间衔接操作，区别于直接按回车提交整个表单。</p>
    <h3><i class="f-icon f-iconfont f-iconfont-edit" aria-hidden="true"></i>用回车逐步完成登录</h3>
    <ol>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxUserName").ClientID %>' title="用户名">用户名</strong>输入 <code>admin</code>，按回车。<br />结果：焦点移到<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxPassword").ClientID %>' title="密码">密码</strong>，此时不提交。</li>
        <li>在<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxPassword").ClientID %>' title="密码">密码</strong>输入 <code>admin</code>，按回车。<br />结果：触发登录按钮；验证通过后回发，后台比对凭据并提示成功登录。</li>
    </ol>
    <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
    <ul class="example-description-properties">
        <li><code>NextFocusControl</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxUserName").ClientID %>' title="用户名">用户名</strong>）：初始为 <code>tbxPassword</code>，在此字段按回车时，把焦点移到指定字段。</li>
        <li><code>NextClickControl</code>（<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxPassword").ClientID %>' title="密码">密码</strong>）：初始为 <code>btnLogin</code>，在此字段按回车时，触发指定按钮。</li>
    </ul>
</section>
</template>
</body>
</html>
