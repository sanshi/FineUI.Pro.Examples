<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_validate_hidden.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_validate_hidden" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/basic/Captcha/captcha.ashx;~/basic/Captcha/CaptchaImage.cs" />
    <style>
        .imgcaptcha .f-field-label {
            margin: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />


        <f:Window ID="Window1" runat="server" Title="登录表单" IsModal="false" EnableClose="false" IconFont="_SignIn"
            WindowPosition="GoldenSection" Width="350px" Layout="Fit">
            <Items>
                <f:SimpleForm ID="SimpleForm1" BoxFlex="1" runat="server" ShowBorder="false" BodyPadding="10px"
                    ShowHeader="false">
                    <Items>
                        <f:TextBox ID="tbxUserName" Label="用户名" Required="true" ShowRedStar="true" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" Label="密码" TextMode="Password" Required="true" ShowRedStar="true" runat="server">
                        </f:TextBox>
                        <f:Panel ID="panelCaptcha" ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigAlign="Stretch" runat="server">
                            <Items>
                                <f:TextBox ID="tbxCaptcha" BoxFlex="1" Margin="0 5px 0 0" Label="验证码" Required="true" runat="server">
                                </f:TextBox>
                                <f:LinkButton ID="imgCaptcha" EncodeText="false" CssClass="imgcaptcha" Width="100px" runat="server" OnClick="imgCaptcha_Click">
                                </f:LinkButton>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="btnLogin" Text="登录" Type="Submit" ValidateForms="SimpleForm1" ValidateTarget="Top"
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
            <p>演示累计登录失败 3 次后显示验证码，并在登录成功后清除失败计数。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>达到阈值后显示验证码</h3>
            <ol>
                <li>
                    在新会话中，用户名输入 admin、密码输入 wrong，连续点击登录 3 次。<br />
                    结果：每次提示用户名或密码错误及次数；第 3 次失败后显示验证码输入框和图片。
                </li>
                <li>
                    验证码出现后，用户名和密码都改为 admin，验证码填写错误值，再登录。<br />
                    结果：后台先拒绝错误验证码，提示“验证码错误！”。
                </li>
                <li>
                    点击验证码图片更换一张，填写图片中的验证码后登录。<br />
                    结果：验证码正确且用户名、密码均为 admin 时提示“成功登录！”，失败计数清零并隐藏验证码。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>用户名：admin <br> 密码：admin <br> <br> 注：默认不显示验证码，当用户输入错误超过 3 次，就显示验证码（在Session中记录用户登录失败的次数）。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Hidden</code>：验证码区域在累计失败次数小于 3 时隐藏，达到阈值后显示。</li>
                <li><code>Required</code>：当前显示的登录字段和验证码字段必须填写。</li>
                <li><code>ValidateForms</code>：登录按钮先执行客户端必填验证。</li>
                <li><code>Session</code>：保存当前会话的失败次数和验证码，登录成功后清零。</li>
            </ul>
        </section>
    </template>
</body>
</html>
