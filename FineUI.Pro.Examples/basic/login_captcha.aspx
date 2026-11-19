<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_captcha.aspx.cs"
    Inherits="FineUI.Pro.Examples.basic.login_captcha" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/basic/Captcha/captcha.ashx;~/basic/Captcha/CaptchaImage.cs" />
    <style>
        .imgcaptcha .f-field-label {
            margin: 0;
        }


        .login-image {
            border-width: 0 1px 0 0;
            border-radius: 0;
        }

        .login-image .f-panel-body {
            display: flex;
            align-items: center;
        }

        .login-image .f-icon {
            font-size: 120px;
            width: 120px;
            height: 120px;
            line-height: 120px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        用户名：admin
        <br />
        密码：admin
        <br />
        <br />
        <f:Window ID="Window1" runat="server" Title="登录表单" IsModal="false" EnableClose="false" IconFont="_SignIn" WindowPosition="GoldenSection" Width="450px"
            Layout="HBox">
            <Items>
                <f:ContentPanel CssClass="login-image" BodyPadding="10px" ShowBorder="true" ShowHeader="false" runat="server">
                    <i class="f-icon f-icon-key"></i>
                </f:ContentPanel>
                <f:SimpleForm ID="SimpleForm1" LabelAlign="Top" BoxFlex="1" runat="server" ShowBorder="false" BodyPadding="10px" ShowHeader="false">
                    <Items>
                        <f:TextBox ID="tbxUserName" Label="用户名" Required="true" ShowRedStar="true" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" TextMode="Password" Required="true" ShowRedStar="true" runat="server">
                        </f:TextBox>
                        <f:Panel ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigAlign="End" BoxConfigSpace="5" RemoveFieldsMargin="true"
                            runat="server">
                            <Items>
                                <f:TextBox ID="tbxCaptcha" BoxFlex="1" Label="验证码" Required="true" ShowRedStar="true" runat="server">
                                </f:TextBox>
                                <f:LinkButton ID="imgCaptcha" EncodeText="false" CssClass="imgcaptcha" Width="100px" Height="26px" runat="server"
                                    OnClick="imgCaptcha_Click">
                                </f:LinkButton>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="btnLogin" Text="登录" Type="Submit" ValidateForms="SimpleForm1" ValidateTarget="Top" ButtonColor="Primary" runat="server"
                            OnClick="btnLogin_Click">
                        </f:Button>
                        <f:Button ID="btnReset" Text="重置" Type="Reset" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>在登录表单中增加可点击刷新的验证码，并在后台先校验验证码再校验凭据。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>刷新验证码后登录</h3>
            <ol>
                <li>点击<strong class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("imgCaptcha").ClientID %>'
                        title="链接按钮">验证码图片</strong>。<br />结果：图片重新请求，<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxCaptcha").ClientID %>' title="验证码">验证码</strong>内容更新。</li>
                <li>用户名和密码均输入 <code>admin</code>，把图片中的字符输入<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxCaptcha").ClientID %>'
                        title="验证码">验证码</strong>后点击登录。<br />结果：后台先比对验证码，再判断用户名和密码；错误验证码显示验证码错误提示，不执行成功分支。</li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>TextMode</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxPassword").ClientID %>' title="密码">密码</strong>）：初始为
                    <code>Password</code>，以密码模式隐藏实际输入文字。
                </li>
                <li><code>Required</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxUserName").ClientID %>' title="用户名">用户名</strong>、<strong
                        class="example-control-reference" data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxPassword").ClientID %>'
                        title="密码">密码</strong>、<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("tbxCaptcha").ClientID %>' title="验证码">验证码</strong>）：初始为
                    <code>true</code>，要求先填写或选择该字段，未通过时阻止表单提交。
                </li>
                <li><code>ValidateForms</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("btnLogin").ClientID %>' title="登录">登录</strong>）：初始为
                    <code>SimpleForm1</code>，提交前验证指定表单；验证失败时显示提示并阻止回发。
                </li>
                <li><code>验证码会话值</code>（<strong class="example-control-reference"
                        data-example-control='<%= FineUI.Pro.ControlUtil.FindControl("imgCaptcha").ClientID %>'
                        title="链接按钮">链接按钮</strong>）：后台生成并校验当前验证码，刷新图片后应使用新显示的字符。</li>
            </ul>
        </section>
    </template>
</body>
</html>
