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
        <f:SimpleForm ID="SimpleForm1" IsFluid="true" runat="server" BodyPadding="10px" EnableCollapse="false" Title="用户注册表单">
            <Items>
                <f:TextBox ID="tbxUserName" runat="server" Label="用户名" Required="true" NextFocusControl="tbxPassword" ShowRedStar="true" Text="admin">
                </f:TextBox>
                <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" NextClickControl="btnRegister" TextMode="Password"
                    ValidatorFunction="passwordValidator">
                </f:TextBox>
                <f:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click" ValidateForms="SimpleForm1" ValidateTarget="Top">
                </f:Button>
            </Items>
        </f:SimpleForm>


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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示用客户端自定义验证函数检查密码长度，要求恰好输入 6 个字符。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>执行自定义验证</h3>
            <ol>
                <li>
                    用户名保持有值，密码输入“123”，点击“注册”。<br />
                    结果：密码框显示“密码必须为 6 个字符！”，浏览器阻止回发。
                </li>
                <li>
                    关闭验证提示，将密码改为“123456”，再次点击“注册”。<br />
                    结果：长度检查通过后才回发，后台提示“表单验证通过！”。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li> 提交表单时客户端验证[密码]必须为 6 个字符，否则标记为无效。 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ValidatorFunction</code>：指定 passwordValidator；函数读取当前密码，符合条件返回 true，否则返回错误文字。</li>
            </ul>
        </section>
    </template>
</body>
</html>
