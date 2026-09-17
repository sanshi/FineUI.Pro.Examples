<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_validate_validator_params.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_validate_validator_params" %>

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
                <f:TextBox ID="TextBox1" runat="server" Label="输入框一" Required="true"
                    ShowRedStar="true" ValidatorFunction="inputValidator">
                </f:TextBox>
                <f:TextBox ID="TextBox2" runat="server" Label="输入框二" Required="true"
                    ShowRedStar="true" ValidatorFunction="inputValidator">
                </f:TextBox>
                <f:Button ID="btnRegister" runat="server" Text="提交表单" OnClick="btnRegister_Click" ValidateForms="SimpleForm1">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        注：
        <ul>
            <li>[输入框一]的最大长度为 3 个字符。
            </li>
            <li>[输入框二]的最大长度为 6 个字符。
            </li>
        </ul>
    </form>
    <script>

        function inputValidator() {
            var inputCmp = this;
            var value = $.trim(inputCmp.getValue());
            var maxLength = parseInt(inputCmp.getAttr('data-maxlength'), 10);

            if (value.length <= maxLength) {
                return true;
            } else {
                return '最多只能输入 ' + maxLength + ' 个字符！';
            }
        }

    </script>
</body>
</html>
