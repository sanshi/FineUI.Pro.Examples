<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_validate_validator.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_validate_validator" %>

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
                <f:TextBox ID="tbxUserName" runat="server" Label="用户名" Required="true" NextFocusControl="tbxPassword"
                    ShowRedStar="true" Text="admin">
                </f:TextBox>
                <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" NextFocusControl="btnRegister"
                    TextMode="Password" ValidatorFunction="passwordValidator">
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
            <li>
                提交表单时客户端验证[密码]必须为 6 个字符，否则标记为无效。
            </li>
        </ul>
    </form>
    <script>

        function passwordValidator() {
            var value = $.trim(this.getValue());
            if (value.length === 6) {
                return true;
            } else {
                return '密码必须为 6 个字符！';
            }
        }

    </script>
</body>
</html>
