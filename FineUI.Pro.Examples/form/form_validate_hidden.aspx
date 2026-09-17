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
        用户名：admin
        <br />
        密码：admin
        <br />
        <br />
        注：默认不显示验证码，当用户输入错误超过 3 次，就显示验证码（在Session中记录用户登陆失败的次数）。
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
</body>
</html>
