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
                <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" NextClickControl="btnRegister"
                    TextMode="Password">
                </f:TextBox>
                <f:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click" ClickHandler="onClientValidateClick"
                    ValidateForms="SimpleForm1" ValidateTarget="Top">
                </f:Button>
            </Items>
        </f:SimpleForm>


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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示在按钮客户端回调中检查密码，返回 false 时停止后续处理。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>校验失败后修正</h3>
            <ol>
                <li>
                    用户名保持有值，密码输入 123，点击“注册”。<br />
                    结果：浏览器提示“密码必须为 6 个字符！”并标记密码字段，客户端回调返回 false，后续处理停止。
                </li>
                <li>
                    关闭提示，密码改为 123456，再次注册。<br />
                    结果：客户端回调返回 true，才回发到后台并显示“表单验证通过！”。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li> 提交表单时客户端验证[密码]必须为 6 个字符，否则标记为无效。 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ClickHandler</code>：客户端函数先检查密码长度，返回 false 阻止后台事件。</li>
                <li><code>markInvalid()</code>：浏览器把业务错误标记到密码输入框。</li>
                <li><code>OnClick</code>：只在表单验证与客户端回调都通过后执行后台方法。</li>
            </ul>
        </section>
    </template>
</body>
</html>
