<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_validate_blur.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_validate_blur" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" BodyPadding="10px" EnableCollapse="false"
            Title="用户注册表单">
            <Items>
                <f:TextBox ID="tbxUserName" runat="server" Label="用户名" Required="true" NextFocusControl="tbxPassword" EnableBlurEvent="true" OnBlur="tbxUserName_Blur"
                    ShowRedStar="true" Text="admin">
                </f:TextBox>
                <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" NextFocusControl="btnRegister"
                    TextMode="Password">
                </f:TextBox>
                <f:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click"
                    ValidateForms="SimpleForm1" ValidateTarget="Top">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        注：
        <ul>
            <li>[用户名]失去焦点，如果为 admin，则标记为无效；否则去除无效标记
            </li>
            <li>[用户名]按下 Enter 键，如果为 admin，则标记为无效；否则去除无效标记，并跳转到[密码]
            </li>
            <li>[密码]按下 Enter 键，提交表单
            </li>
        </ul>
    </form>
</body>
</html>
