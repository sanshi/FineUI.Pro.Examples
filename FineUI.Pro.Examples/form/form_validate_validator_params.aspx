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
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示两个文本框共用同一个验证函数，通过各自参数设置不同的最大长度。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>使用字段自己的长度上限</h3>
            <ol>
                <li>
                    输入框一填写 abcd，输入框二填写 abc，点击“注册”。<br />
                    结果：输入框一提示最多 3 个字符，浏览器阻止后续提交。
                </li>
                <li>
                    关闭提示，将输入框一改为 abc，再点击“注册”。<br />
                    结果：验证通过后回发，后台显示验证成功提示。
                </li>
                <li>
                    再将输入框二改为 abcdefg 并提交。<br />
                    结果：它按自己的上限提示最多 6 个字符，不会沿用第一个字段的 3。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li>[输入框一]的最大长度为 3 个字符。 </li>
                <li>[输入框二]的最大长度为 6 个字符。 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>ValidatorFunction</code>：两个输入框都使用 inputValidator，符合规则返回 true，失败返回错误文字。</li>
                <li><code>data-maxlength</code>：本页在字段属性中分别设置为 3、6，函数读取各自的值。</li>
            </ul>
        </section>
    </template>
</body>
</html>
