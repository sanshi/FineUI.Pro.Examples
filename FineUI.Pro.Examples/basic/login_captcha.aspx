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
        <f:Window ID="Window1" runat="server" Title="登录表单" IsModal="false" EnableClose="false" IconFont="_SignIn"
            WindowPosition="GoldenSection" Width="450px" Layout="HBox">
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
                        <f:Panel ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigAlign="End" BoxConfigSpace="5" RemoveFieldsMargin="true" runat="server">
                            <Items>
                                <f:TextBox ID="tbxCaptcha" BoxFlex="1" Label="验证码" Required="true" ShowRedStar="true" runat="server">
                                </f:TextBox>
                                <f:LinkButton ID="imgCaptcha" EncodeText="false" CssClass="imgcaptcha" Width="100px" Height="26px" runat="server" OnClick="imgCaptcha_Click">
                                </f:LinkButton>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="btnLogin" Text="登录" Type="Submit" ValidateForms="SimpleForm1" ValidateTarget="Top" ButtonColor="Primary"
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
