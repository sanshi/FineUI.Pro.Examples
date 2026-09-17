<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientvalidate.aspx.cs"
    Inherits="FineUI.Pro.Examples.other.clientvalidate" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" BodyPadding="10px"  EnableCollapse="false"
            Title="用户注册表单">
            <Items>
                <f:TextBox ID="tbxUserName" runat="server" Label="用户名" Required="true" NextFocusControl="tbxPassword"
                    ShowRedStar="true" Text="admin">
                </f:TextBox>
                <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" NextFocusControl="btnRegister"
                    TextMode="Password">
                </f:TextBox>
                <f:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click" ClickHandler="onClientValidateClick"
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

        var tbxPasswordClientID = '<%= tbxPassword.ClientID %>';

        // 客户端验证
        function onClientValidateClick(event) {
            var tbxPassword = F(tbxPasswordClientID);
            var value = $.trim(tbxPassword.getValue());
            if (value.length === 6) {
                return true;
            } else {
                F.alert('密码必须为 6 个字符！');
                tbxPassword.markInvalid();
                return false;
            }
        }

    </script>
</body>
</html>
