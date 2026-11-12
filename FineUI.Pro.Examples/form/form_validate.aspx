<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_validate.aspx.cs"
    Inherits="FineUI.Pro.Examples.form.form_validate" %>

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
                <f:TextBox ID="tbxPassword" runat="server" Label="密码" Required="true" ShowRedStar="true" NextClickControl="btnRegister" TextMode="Password">
                </f:TextBox>
                <f:Button ID="btnRegister" runat="server" Text="注册" OnClick="btnRegister_Click" ValidateForms="SimpleForm1" ValidateTarget="Top">
                </f:Button>
            </Items>
        </f:SimpleForm>


    </form>
    <template id="example-description">
        <section aria-label="页面描述">
            <p>演示注册表单的必填检查、后台业务校验，以及将错误标记到具体字段。</p>
            <h3><i class="f-icon f-iconfont f-iconfont-check" aria-hidden="true"></i>检查必填与保留字</h3>
            <ol>
                <li>
                    保留用户名“admin”，密码为空，点击“注册”。<br />
                    结果：密码提示必填，后续业务校验不执行。
                </li>
                <li>
                    关闭必填提示，密码输入“123456”，再次点击“注册”。<br />
                    结果：必填检查通过后回发，由后台检查用户名，用户名被标记为无效，提示“admin 是保留字，请另外选择！”。
                </li>
                <li>
                    将用户名改为“demo”，再次点击“注册”。<br />
                    结果：不再触发 admin 的保留字错误；本页没有实现实际注册和成功提示。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-keyboard" aria-hidden="true"></i>使用 Enter 操作</h3>
            <ol>
                <li>
                    在用户名框按 Enter。<br />
                    结果：焦点转到密码框。
                </li>
                <li>
                    在密码框按 Enter。<br />
                    结果：触发“注册”按钮，执行相同的必填检查和业务校验。
                </li>
            </ol>
            <h3><i class="f-icon f-iconfont f-iconfont-info" aria-hidden="true"></i>补充说明</h3>
            <p>注：</p>
            <ul>
                <li>提交表单时验证[用户名]不能为 admin，否则标记为无效。 </li>
            </ul>
            <h3><i class="f-icon f-iconfont f-iconfont-gear" aria-hidden="true"></i>关键属性</h3>
            <ul class="example-description-properties">
                <li><code>Required</code>：用户名和密码都设为 true，不能为空。</li>
                <li><code>ValidateForms</code>：注册按钮指定 SimpleForm1，浏览器验证通过后才回发。</li>
                <li><code>MarkInvalid()</code>：后台将保留字错误显示到用户名字段。</li>
                <li><code>NextFocusControl</code>：用户名框指定 tbxPassword，按 Enter 聚焦密码框。</li>
                <li><code>NextClickControl</code>：密码框指定 btnRegister，按 Enter 触发注册按钮。</li>
            </ul>
        </section>
    </template>
</body>
</html>
